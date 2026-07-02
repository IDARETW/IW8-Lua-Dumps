module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._isPlayingBaseWeaponFlare then
		return
	end

	ACTIONS.AnimateSequence(arg_1_0.LootItemCardFlare, "BattlePassIntroduction")

	arg_1_0._isPlayingBaseWeaponFlare = true
end

local function var_0_1(arg_2_0)
	ACTIONS.AnimateSequence(arg_2_0.LootItemCardFlare, "BattlePassPurchasedFast")
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = "Base"
	local var_3_1 = SOUND_SETS.battlePass.bpBase

	if arg_3_1 == LOOT.Rarity.COMMON then
		var_3_0 = "Common"
		var_3_1 = SOUND_SETS.battlePass.bpCommon
	elseif arg_3_1 == LOOT.Rarity.RARE then
		var_3_0 = "Rare"
		var_3_1 = SOUND_SETS.battlePass.bpRare
	elseif arg_3_1 == LOOT.Rarity.EPIC then
		var_3_0 = "Epic"
		var_3_1 = SOUND_SETS.battlePass.bpEpic
	elseif arg_3_1 == LOOT.Rarity.LEGENDARY then
		var_3_0 = "Legendary"
		var_3_1 = SOUND_SETS.battlePass.bpLegendary
	end

	Engine.BJDBIAGIDA(var_3_1)
	ACTIONS.AnimateSequence(arg_3_0.LootItemCardFlare, var_3_0)
end

local function var_0_3(arg_4_0, arg_4_1)
	ACTIONS.AnimateSequence(arg_4_0.LootItemCardFlare, "StopEffect")

	arg_4_0._isPlayingBaseWeaponFlare = false
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.PlayRarityFlare = var_0_2
	arg_5_0.PlayPurchasedFlare = var_0_1
	arg_5_0.ClearFlare = var_0_3
	arg_5_0.PlayBaseWeaponFlare = var_0_0
	arg_5_0._isPlayingBaseWeaponFlare = false
end

function BattlePassFlare(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 238 * _1080p)

	var_6_0.id = "BattlePassFlare"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = MenuBuilder.BuildRegisteredType("LootItemCardFlare", {
		controllerIndex = var_6_1
	})

	var_6_4.id = "LootItemCardFlare"

	var_6_4:SetScale(-0.14, 0)
	var_6_4:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -476, _1080p * 36)
	var_6_0:addElement(var_6_4)

	var_6_0.LootItemCardFlare = var_6_4

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("BattlePassFlare", BattlePassFlare)
LockTable(_M)
