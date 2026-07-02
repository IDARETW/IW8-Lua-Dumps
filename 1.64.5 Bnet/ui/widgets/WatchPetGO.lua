module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.LeftMonster:setImageFiltering(1)
	arg_1_0.RightMonster:setImageFiltering(1)

	arg_1_0.playerData = PlayerData.BFFBGAJGD(arg_1_1, CoD.StatsGroup.Common).petWatchGoData

	local var_1_0 = 1
	local var_1_1 = 1

	local function var_1_2(arg_2_0)
		if var_1_0 == 1 then
			ACTIONS.AnimateSequence(arg_2_0, "GOPetIdleA")
		elseif var_1_0 == 2 then
			ACTIONS.AnimateSequence(arg_2_0, "GOPetIdleB")
		elseif var_1_0 == 3 then
			ACTIONS.AnimateSequence(arg_2_0, "GOPetIdleC")
		end
	end

	local function var_1_3(arg_3_0)
		if var_1_1 == 1 then
			ACTIONS.AnimateSequence(arg_3_0, "GOPetEnemyIdleA")
		elseif var_1_1 == 2 then
			ACTIONS.AnimateSequence(arg_3_0, "GOPetEnemyIdleB")
		elseif var_1_1 == 3 then
			ACTIONS.AnimateSequence(arg_3_0, "GOPetEnemyIdleC")
		end
	end

	local function var_1_4(arg_4_0, arg_4_1)
		if arg_4_1 >= 100 then
			DebugPrint("ENEMY PET WATCH GO SetPetState " .. arg_4_1 - 100)

			var_1_1 = arg_4_1 - 100

			var_1_3(arg_4_0)
		else
			DebugPrint("PET WATCH GO SetPetState " .. arg_4_1)

			var_1_0 = arg_4_1

			var_1_2(arg_4_0)
		end
	end

	local function var_1_5(arg_5_0)
		var_1_2(arg_5_0)
		var_1_3(arg_5_0)
	end

	local function var_1_6(arg_6_0, arg_6_1)
		Engine.BJDBIAGIDA("watch_pet_happy_baby")
		DebugPrint("PET WATCH GO Captured a " .. arg_6_1)
	end

	local function var_1_7(arg_7_0, arg_7_1)
		if arg_7_1 < 15 then
			var_1_6(arg_7_0, arg_7_1)
		end
	end

	local function var_1_8(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_1 / 100
		local var_8_1 = -(arg_8_1 % 100 * 10) * math.pi / 180
		local var_8_2 = math.min(1, var_8_0 / 2000)
		local var_8_3 = math.cos(var_8_1) * var_8_2 * -256
		local var_8_4 = math.sin(var_8_1) * var_8_2 * 256
		local var_8_5 = var_8_4 - 32 + 256
		local var_8_6 = var_8_4 + 32 + 256
		local var_8_7 = var_8_3 - 32 + 256
		local var_8_8 = var_8_3 + 32 + 256

		arg_8_0.RadarBlip:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_8_5, _1080p * var_8_6, _1080p * var_8_7, _1080p * var_8_8)
	end

	local function var_1_9(arg_9_0)
		arg_9_0.RadarBG:SetAlpha(0, 0)
		arg_9_0.RadarBlip:SetAlpha(0, 0)
		arg_9_0.RightMonster:SetAlpha(1, 0)
		arg_9_0.LeftMonster:SetAlpha(1, 0)
		var_1_5(arg_9_0)
	end

	local function var_1_10(arg_10_0)
		arg_10_0.RadarBG:SetAlpha(1, 0)
		arg_10_0.RadarBlip:SetAlpha(1, 0)
		arg_10_0.RightMonster:SetAlpha(0, 0)
		arg_10_0.LeftMonster:SetAlpha(0, 0)
	end

	local function var_1_11(arg_11_0, arg_11_1)
		if arg_11_1 == 1 then
			var_1_10(arg_11_0)
		else
			var_1_9(arg_11_0)
		end
	end

	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_0", function(arg_12_0)
		local var_12_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_0")

		var_1_4(arg_12_0, var_12_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_bonus_earned_1", function(arg_13_0)
		local var_13_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_bonus_earned_1")

		var_1_11(arg_13_0, var_13_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_action", function(arg_14_0)
		local var_14_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_action")

		var_1_7(arg_14_0, var_14_0)
	end)
	arg_1_0:registerOmnvarHandler("ui_pet_watch_state", function(arg_15_0)
		local var_15_0 = Game.BFEEGCHICA(arg_1_1, "ui_pet_watch_state")

		var_1_8(arg_15_0, var_15_0)
	end)

	local var_1_12 = StringTable.BFHCAIIDA(CSV.petWatchGOTable.file)

	for iter_1_0 = 0, var_1_12 - 1 do
		local var_1_13 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.ref)
		local var_1_14 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.phaseNum)
		local var_1_15 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.rarity)
		local var_1_16 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.nextForm)
		local var_1_17 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.xpValue)
		local var_1_18 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.charmID)
		local var_1_19 = StringTable.CBGJCDIHCE(CSV.petWatchGOTable.file, iter_1_0, CSV.petWatchGOTable.cols.challengeDesc)
		local var_1_20 = math.floor(tonumber(var_1_14))

		arg_1_0.petGOConsts = {}
		arg_1_0.petGOConsts[var_1_20] = {}
		arg_1_0.petGOConsts[var_1_20].ref = var_1_13
		arg_1_0.petGOConsts[var_1_20].rarity = math.floor(tonumber(var_1_15))
		arg_1_0.petGOConsts[var_1_20].nextForm = math.floor(tonumber(var_1_16))
		arg_1_0.petGOConsts[var_1_20].charmID = math.floor(tonumber(var_1_18))
		arg_1_0.petGOConsts[var_1_20].xpValue = math.floor(tonumber(var_1_17))
		arg_1_0.petGOConsts[var_1_20].challengeDesc = var_1_19
	end

	local function var_1_21(arg_16_0, arg_16_1)
		if GameX.IsRankedMatch() then
			local var_16_0 = {
				controllerIndex = arg_1_1
			}

			var_16_0.header = "SPLASHES/PET_SPLASH_UNLOCK"
			var_16_0.body = "SPLASHES/PET_SPLASH_DESC"
			var_16_0.splashId = arg_16_1
			var_16_0.displayLocation = "petCharm"

			arg_16_0:dispatchEventToRoot({
				name = "add_message_splash_manager",
				immediate = true,
				options = var_16_0
			})

			arg_16_0.charmDelayTimer:Wait(250, true).onComplete = function()
				Engine.EBHIFJCGBH("petwatch_go_charm", arg_16_1)
			end
		end
	end

	var_1_10(arg_1_0)
end

function WatchPetGO(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_18_0.id = "WatchPetGO"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Background"

	var_18_4:SetRGBFromInt(0, 0)
	var_18_4:setImage(RegisterMaterial("watch_pet_turbo_bg_01"), 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Background = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "BarFill"

	var_18_6:SetRGBFromInt(0, 0)
	var_18_6:SetAnchorsAndPosition(1, 0, 1, 0, 0, 0, _1080p * -27, _1080p * -3)
	var_18_0:addElement(var_18_6)

	var_18_0.BarFill = var_18_6

	local var_18_7
	local var_18_8 = LUI.UIImage.new()

	var_18_8.id = "Bored"

	var_18_8:SetRGBFromInt(0, 0)
	var_18_8:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_18_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 385, _1080p * 481)
	var_18_0:addElement(var_18_8)

	var_18_0.Bored = var_18_8

	local var_18_9
	local var_18_10 = LUI.UIImage.new()

	var_18_10.id = "Unruly"

	var_18_10:SetRGBFromInt(0, 0)
	var_18_10:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 305, _1080p * 401)
	var_18_0:addElement(var_18_10)

	var_18_0.Unruly = var_18_10

	local var_18_11
	local var_18_12 = LUI.UIImage.new()

	var_18_12.id = "Sad"

	var_18_12:SetRGBFromInt(0, 0)
	var_18_12:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 228, _1080p * 324)
	var_18_0:addElement(var_18_12)

	var_18_0.Sad = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIImage.new()

	var_18_14.id = "Hungry"

	var_18_14:SetRGBFromInt(0, 0)
	var_18_14:setImage(RegisterMaterial("watch_pet_turbo_progression"), 0)
	var_18_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 389, _1080p * 485, _1080p * 151, _1080p * 247)
	var_18_0:addElement(var_18_14)

	var_18_0.Hungry = var_18_14

	local var_18_15
	local var_18_16 = LUI.UIImage.new()

	var_18_16.id = "LeftMonster"

	var_18_16:setImage(RegisterMaterial("watch_pet_go_test_left"), 0)
	var_18_16:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -243, _1080p * 14, _1080p * -98)
	var_18_0:addElement(var_18_16)

	var_18_0.LeftMonster = var_18_16

	local var_18_17
	local var_18_18 = LUI.UIImage.new()

	var_18_18.id = "RightMonster"

	var_18_18:setImage(RegisterMaterial("watch_pet_go_test_right"), 0)
	var_18_18:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 133, _1080p * 133, _1080p * -9, _1080p * -9)
	var_18_0:addElement(var_18_18)

	var_18_0.RightMonster = var_18_18

	local var_18_19
	local var_18_20 = LUI.UIImage.new()

	var_18_20.id = "RadarBG"

	var_18_20:setImage(RegisterMaterial("hud_radar_background_yz"), 0)
	var_18_20:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * -3, _1080p * -3)
	var_18_0:addElement(var_18_20)

	var_18_0.RadarBG = var_18_20

	local var_18_21
	local var_18_22 = LUI.UIImage.new()

	var_18_22.id = "RadarBlip"

	var_18_22:setImage(RegisterMaterial("heart_sensor_ping"), 0)
	var_18_22:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 64, 0, _1080p * 64)
	var_18_0:addElement(var_18_22)

	var_18_0.RadarBlip = var_18_22

	local function var_18_23()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_23

	local var_18_24
	local var_18_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		}
	}

	var_18_16:RegisterAnimationSequence("GOPetIdleA", var_18_25)

	local function var_18_26()
		var_18_16:AnimateLoop("GOPetIdleA")
	end

	var_18_0._sequences.GOPetIdleA = var_18_26

	local var_18_27
	local var_18_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_g")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_g")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_g")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_g")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_g")
		}
	}

	var_18_16:RegisterAnimationSequence("GOPetIdleB", var_18_28)

	local function var_18_29()
		var_18_16:AnimateLoop("GOPetIdleB")
	end

	var_18_0._sequences.GOPetIdleB = var_18_29

	local var_18_30
	local var_18_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_p")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_p")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_p")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_p")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left_p")
		}
	}

	var_18_16:RegisterAnimationSequence("GOPetIdleC", var_18_31)

	local function var_18_32()
		var_18_16:AnimateLoop("GOPetIdleC")
	end

	var_18_0._sequences.GOPetIdleC = var_18_32

	local var_18_33
	local var_18_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_left")
		}
	}

	var_18_18:RegisterAnimationSequence("GOPetEnemyIdleA", var_18_34)

	local function var_18_35()
		var_18_18:AnimateLoop("GOPetEnemyIdleA")
	end

	var_18_0._sequences.GOPetEnemyIdleA = var_18_35

	local var_18_36
	local var_18_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_y")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_y")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_y")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_y")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_y")
		}
	}

	var_18_18:RegisterAnimationSequence("GOPetEnemyIdleB", var_18_37)

	local function var_18_38()
		var_18_18:AnimateLoop("GOPetEnemyIdleB")
	end

	var_18_0._sequences.GOPetEnemyIdleB = var_18_38

	local var_18_39
	local var_18_40 = {
		{
			duration = 1600,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_pi")
		}
	}

	var_18_16:RegisterAnimationSequence("GOPetEnemyIdleC", var_18_40)

	local var_18_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_pi")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_pi")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_pi")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_go_test_right_pi")
		}
	}

	var_18_18:RegisterAnimationSequence("GOPetEnemyIdleC", var_18_41)

	local function var_18_42()
		var_18_16:AnimateLoop("GOPetEnemyIdleC")
		var_18_18:AnimateLoop("GOPetEnemyIdleC")
	end

	var_18_0._sequences.GOPetEnemyIdleC = var_18_42

	local var_18_43
	local var_18_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_egg_01")
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_egg_02")
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_egg_01")
		}
	}

	var_18_16:RegisterAnimationSequence("IdleEgg", var_18_44)

	local function var_18_45()
		var_18_16:AnimateLoop("IdleEgg")
	end

	var_18_0._sequences.IdleEgg = var_18_45

	local var_18_46
	local var_18_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		}
	}

	var_18_16:RegisterAnimationSequence("BabyIdle", var_18_47)

	local function var_18_48()
		var_18_16:AnimateLoop("BabyIdle")
	end

	var_18_0._sequences.BabyIdle = var_18_48

	local var_18_49
	local var_18_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		}
	}

	var_18_16:RegisterAnimationSequence("ChildIdle", var_18_50)

	local function var_18_51()
		var_18_16:AnimateLoop("ChildIdle")
	end

	var_18_0._sequences.ChildIdle = var_18_51

	local var_18_52
	local var_18_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		}
	}

	var_18_16:RegisterAnimationSequence("TeenAIdle", var_18_53)

	local function var_18_54()
		var_18_16:AnimateLoop("TeenAIdle")
	end

	var_18_0._sequences.TeenAIdle = var_18_54

	local var_18_55
	local var_18_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		}
	}

	var_18_16:RegisterAnimationSequence("TeenBIdle", var_18_56)

	local function var_18_57()
		var_18_16:AnimateLoop("TeenBIdle")
	end

	var_18_0._sequences.TeenBIdle = var_18_57

	local var_18_58
	local var_18_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
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
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleRiley", var_18_59)

	local function var_18_60()
		var_18_16:AnimateLoop("AdultIdleRiley")
	end

	var_18_0._sequences.AdultIdleRiley = var_18_60

	local var_18_61
	local var_18_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		}
	}

	var_18_16:RegisterAnimationSequence("BabyIdleHappy", var_18_62)

	local function var_18_63()
		var_18_16:AnimateLoop("BabyIdleHappy")
	end

	var_18_0._sequences.BabyIdleHappy = var_18_63

	local var_18_64
	local var_18_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		}
	}

	var_18_16:RegisterAnimationSequence("ChildIdleHappy", var_18_65)

	local function var_18_66()
		var_18_16:AnimateLoop("ChildIdleHappy")
	end

	var_18_0._sequences.ChildIdleHappy = var_18_66

	local var_18_67
	local var_18_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		}
	}

	var_18_16:RegisterAnimationSequence("TeenAIdleHappy", var_18_68)

	local function var_18_69()
		var_18_16:AnimateLoop("TeenAIdleHappy")
	end

	var_18_0._sequences.TeenAIdleHappy = var_18_69

	local var_18_70
	local var_18_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		}
	}

	var_18_16:RegisterAnimationSequence("TeenBIdleHappy", var_18_71)

	local function var_18_72()
		var_18_16:AnimateLoop("TeenBIdleHappy")
	end

	var_18_0._sequences.TeenBIdleHappy = var_18_72

	local var_18_73
	local var_18_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyRiley", var_18_74)

	local function var_18_75()
		var_18_16:AnimateLoop("AdultIdleHappyRiley")
	end

	var_18_0._sequences.AdultIdleHappyRiley = var_18_75

	local var_18_76
	local var_18_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_baby_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_baby_01")
		}
	}

	var_18_16:RegisterAnimationSequence("BabyIdleSad", var_18_77)

	local function var_18_78()
		var_18_16:AnimateLoop("BabyIdleSad")
	end

	var_18_0._sequences.BabyIdleSad = var_18_78

	local var_18_79
	local var_18_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_child_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_child_01")
		}
	}

	var_18_16:RegisterAnimationSequence("ChildIdleSad", var_18_80)

	local function var_18_81()
		var_18_16:AnimateLoop("ChildIdleSad")
	end

	var_18_0._sequences.ChildIdleSad = var_18_81

	local var_18_82
	local var_18_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_teen_a_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_a_01")
		}
	}

	var_18_16:RegisterAnimationSequence("TeenAIdleSad", var_18_83)

	local function var_18_84()
		var_18_16:AnimateLoop("TeenAIdleSad")
	end

	var_18_0._sequences.TeenAIdleSad = var_18_84

	local var_18_85
	local var_18_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_teen_b_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teen_b_01")
		}
	}

	var_18_16:RegisterAnimationSequence("TeenBIdleSad", var_18_86)

	local function var_18_87()
		var_18_16:AnimateLoop("TeenBIdleSad")
	end

	var_18_0._sequences.TeenBIdleSad = var_18_87

	local var_18_88
	local var_18_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_skunk_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_skunk_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadRiley", var_18_89)

	local function var_18_90()
		var_18_16:AnimateLoop("AdultIdleSadRiley")
	end

	var_18_0._sequences.AdultIdleSadRiley = var_18_90

	local var_18_91
	local var_18_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadDragon", var_18_92)

	local function var_18_93()
		var_18_16:AnimateLoop("AdultIdleSadDragon")
	end

	var_18_0._sequences.AdultIdleSadDragon = var_18_93

	local var_18_94
	local var_18_95 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_egg_baby_08"),
			onComplete = onEggToBaby
		}
	}

	var_18_16:RegisterAnimationSequence("EggToBaby", var_18_95)

	local function var_18_96()
		var_18_16:AnimateSequence("EggToBaby")
	end

	var_18_0._sequences.EggToBaby = var_18_96

	local var_18_97
	local var_18_98 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_baby_child_05"),
			onComplete = onBabyToChild
		}
	}

	var_18_16:RegisterAnimationSequence("BabyToChild", var_18_98)

	local function var_18_99()
		var_18_16:AnimateSequence("BabyToChild")
	end

	var_18_0._sequences.BabyToChild = var_18_99

	local var_18_100
	local var_18_101 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_09"),
			onComplete = onChildToTeenA
		}
	}

	var_18_16:RegisterAnimationSequence("ChildToTeenA", var_18_101)

	local function var_18_102()
		var_18_16:AnimateSequence("ChildToTeenA")
	end

	var_18_0._sequences.ChildToTeenA = var_18_102

	local var_18_103
	local var_18_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_child_teen_09"),
			onComplete = onChildToTeenB
		}
	}

	var_18_16:RegisterAnimationSequence("ChildToTeenB", var_18_104)

	local function var_18_105()
		var_18_16:AnimateSequence("ChildToTeenB")
	end

	var_18_0._sequences.ChildToTeenB = var_18_105

	local var_18_106
	local var_18_107 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_14"),
			onComplete = onTeenAToAdult
		}
	}

	var_18_16:RegisterAnimationSequence("TeenAToAdult", var_18_107)

	local function var_18_108()
		var_18_16:AnimateSequence("TeenAToAdult")
	end

	var_18_0._sequences.TeenAToAdult = var_18_108

	local var_18_109
	local var_18_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_teen_adult_13"),
			onComplete = onTeenBToAdult
		}
	}

	var_18_16:RegisterAnimationSequence("TeenBToAdult", var_18_110)

	local function var_18_111()
		var_18_16:AnimateSequence("TeenBToAdult")
	end

	var_18_0._sequences.TeenBToAdult = var_18_111

	local var_18_112
	local var_18_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_12")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_13")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_14")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_15")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_transform_adult_dead_16"),
			onComplete = onDead
		}
	}

	var_18_16:RegisterAnimationSequence("AdultToDead", var_18_113)

	local function var_18_114()
		var_18_16:AnimateSequence("AdultToDead")
	end

	var_18_0._sequences.AdultToDead = var_18_114

	local var_18_115
	local var_18_116 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_dead_01")
		}
	}

	var_18_16:RegisterAnimationSequence("DeadIdle", var_18_116)

	local function var_18_117()
		var_18_16:AnimateLoop("DeadIdle")
	end

	var_18_0._sequences.DeadIdle = var_18_117

	local var_18_118
	local var_18_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdlePanda", var_18_119)

	local function var_18_120()
		var_18_16:AnimateLoop("AdultIdlePanda")
	end

	var_18_0._sequences.AdultIdlePanda = var_18_120

	local var_18_121
	local var_18_122 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleGhost", var_18_122)

	local function var_18_123()
		var_18_16:AnimateLoop("AdultIdleGhost")
	end

	var_18_0._sequences.AdultIdleGhost = var_18_123

	local var_18_124
	local var_18_125 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_09")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_10")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_11")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdlePony", var_18_125)

	local function var_18_126()
		var_18_16:AnimateLoop("AdultIdlePony")
	end

	var_18_0._sequences.AdultIdlePony = var_18_126

	local var_18_127
	local var_18_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_05")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_06")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_07")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_08")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleUnicorn", var_18_128)

	local function var_18_129()
		var_18_16:AnimateLoop("AdultIdleUnicorn")
	end

	var_18_0._sequences.AdultIdleUnicorn = var_18_129

	local var_18_130
	local var_18_131 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleVampire", var_18_131)

	local function var_18_132()
		var_18_16:AnimateLoop("AdultIdleVampire")
	end

	var_18_0._sequences.AdultIdleVampire = var_18_132

	local var_18_133
	local var_18_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_04")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleBabyDragon", var_18_134)

	local function var_18_135()
		var_18_16:AnimateLoop("AdultIdleBabyDragon")
	end

	var_18_0._sequences.AdultIdleBabyDragon = var_18_135

	local var_18_136
	local var_18_137 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_02")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_03")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_04")
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleBat", var_18_137)

	local function var_18_138()
		var_18_16:AnimateLoop("AdultIdleBat")
	end

	var_18_0._sequences.AdultIdleBat = var_18_138

	local var_18_139
	local var_18_140 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_02")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_03")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_04")
		},
		{
			duration = 2000,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleDragon", var_18_140)

	local function var_18_141()
		var_18_16:AnimateLoop("AdultIdleDragon")
	end

	var_18_0._sequences.AdultIdleDragon = var_18_141

	local var_18_142
	local var_18_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyBabyDragon", var_18_143)

	local function var_18_144()
		var_18_16:AnimateLoop("AdultIdleHappyBabyDragon")
	end

	var_18_0._sequences.AdultIdleHappyBabyDragon = var_18_144

	local var_18_145
	local var_18_146 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyBat", var_18_146)

	local function var_18_147()
		var_18_16:AnimateLoop("AdultIdleHappyBat")
	end

	var_18_0._sequences.AdultIdleHappyBat = var_18_147

	local var_18_148
	local var_18_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_teddyrex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_teddyrex_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyDragon", var_18_149)

	local function var_18_150()
		var_18_16:AnimateLoop("AdultIdleHappyDragon")
	end

	var_18_0._sequences.AdultIdleHappyDragon = var_18_150

	local var_18_151
	local var_18_152 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyGhost", var_18_152)

	local function var_18_153()
		var_18_16:AnimateLoop("AdultIdleHappyGhost")
	end

	var_18_0._sequences.AdultIdleHappyGhost = var_18_153

	local var_18_154
	local var_18_155 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyPanda", var_18_155)

	local function var_18_156()
		var_18_16:AnimateLoop("AdultIdleHappyPanda")
	end

	var_18_0._sequences.AdultIdleHappyPanda = var_18_156

	local var_18_157
	local var_18_158 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyPony", var_18_158)

	local function var_18_159()
		var_18_16:AnimateLoop("AdultIdleHappyPony")
	end

	var_18_0._sequences.AdultIdleHappyPony = var_18_159

	local var_18_160
	local var_18_161 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyUnicorn", var_18_161)

	local function var_18_162()
		var_18_16:AnimateLoop("AdultIdleHappyUnicorn")
	end

	var_18_0._sequences.AdultIdleHappyUnicorn = var_18_162

	local var_18_163
	local var_18_164 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_happy_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleHappyVampire", var_18_164)

	local function var_18_165()
		var_18_16:AnimateLoop("AdultIdleHappyVampire")
	end

	var_18_0._sequences.AdultIdleHappyVampire = var_18_165

	local var_18_166
	local var_18_167 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_trex_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_trex_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadBabyDragon", var_18_167)

	local function var_18_168()
		var_18_16:AnimateLoop("AdultIdleSadBabyDragon")
	end

	var_18_0._sequences.AdultIdleSadBabyDragon = var_18_168

	local var_18_169
	local var_18_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_bear_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_bear_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadBat", var_18_170)

	local function var_18_171()
		var_18_16:AnimateLoop("AdultIdleSadBat")
	end

	var_18_0._sequences.AdultIdleSadBat = var_18_171

	local var_18_172
	local var_18_173 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_fox_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_fox_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadGhost", var_18_173)

	local function var_18_174()
		var_18_16:AnimateLoop("AdultIdleSadGhost")
	end

	var_18_0._sequences.AdultIdleSadGhost = var_18_174

	local var_18_175
	local var_18_176 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_mantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_mantis_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadPanda", var_18_176)

	local function var_18_177()
		var_18_16:AnimateLoop("AdultIdleSadPanda")
	end

	var_18_0._sequences.AdultIdleSadPanda = var_18_177

	local var_18_178
	local var_18_179 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_smuggy_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_smuggy_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadPony", var_18_179)

	local function var_18_180()
		var_18_16:AnimateLoop("AdultIdleSadPony")
	end

	var_18_0._sequences.AdultIdleSadPony = var_18_180

	local var_18_181
	local var_18_182 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_octomantis_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_octomantis_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadUnicorn", var_18_182)

	local function var_18_183()
		var_18_16:AnimateLoop("AdultIdleSadUnicorn")
	end

	var_18_0._sequences.AdultIdleSadUnicorn = var_18_183

	local var_18_184
	local var_18_185 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_sad_badgercat_01")
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("watch_pet_turbo_idle_badgercat_01")
		}
	}

	var_18_16:RegisterAnimationSequence("AdultIdleSadVampire", var_18_185)

	local function var_18_186()
		var_18_16:AnimateLoop("AdultIdleSadVampire")
	end

	var_18_0._sequences.AdultIdleSadVampire = var_18_186

	PostLoadFunc(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("WatchPetGO", WatchPetGO)
LockTable(_M)
