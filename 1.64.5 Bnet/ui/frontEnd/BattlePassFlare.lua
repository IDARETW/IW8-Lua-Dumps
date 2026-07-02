module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._isPlayingBaseWeaponFlare then
		return
	end

	ACTIONS.AnimateSequence(arg_1_0.LootItemCardFlare, "BattlePassIntroduction")

	arg_1_0._isPlayingBaseWeaponFlare = true
end

local function var_0_1(arg_2_0)
	arg_2_0.LootItemCardFlare:PlayFlareSprite("BattlePassPurchasedFast")
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = LOOT.RarityEffects[arg_3_1] and LOOT.RarityEffects[arg_3_1].sfx or SOUND_SETS.battlePass.bpBase

	Engine.BJDBIAGIDA(var_3_0)

	local var_3_1 = LOOT.RarityEffects[arg_3_1] and LOOT.RarityEffects[arg_3_1].flareRef or "Base"

	arg_3_0.LootItemCardFlare:PlayFlareSprite(var_3_1)
end

local function var_0_3(arg_4_0)
	Engine.BJDBIAGIDA(SOUND_SETS.battlePass.bpVanguardFlare)
	arg_4_0.LootItemCardFlare:PlayFlareSprite("Vanguard")
end

local function var_0_4(arg_5_0, arg_5_1)
	ACTIONS.AnimateSequence(arg_5_0.LootItemCardFlare, "StopEffect")

	arg_5_0._isPlayingBaseWeaponFlare = false
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.PlayRarityFlare = var_0_2
	arg_6_0.PlayPurchasedFlare = var_0_1
	arg_6_0.ClearFlare = var_0_4
	arg_6_0.PlayBaseWeaponFlare = var_0_0
	arg_6_0.PlayVanguardFlare = var_0_3
	arg_6_0._isPlayingBaseWeaponFlare = false
end

function BattlePassFlare(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 238 * _1080p)

	var_7_0.id = "BattlePassFlare"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "LootItemCardFlare"

	var_7_4:SetScale(-0.14, 0)
	var_7_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -476, _1080p * 36)
	var_7_0:addElement(var_7_4)

	var_7_0.LootItemCardFlare = var_7_4

	var_0_5(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BattlePassFlare", BattlePassFlare)
LockTable(_M)
