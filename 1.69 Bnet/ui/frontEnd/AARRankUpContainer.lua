module(..., package.seeall)

local var_0_0 = 2700
local var_0_1 = 2000
local var_0_2 = 300
local var_0_3 = 1800

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._unlockAnimationCounter

	if arg_1_0._curLineDisplayed == 2 then
		var_1_0 = var_1_0 + AAR.MAX_UNLOCK_DISPLAY_NUM
	elseif arg_1_0._curLineDisplayed == 3 then
		var_1_0 = var_1_0 + AAR.MAX_UNLOCK_DISPLAY_NUM * 2
	end

	local var_1_1 = SOUND_SETS.aarrewards.unlocks
	local var_1_2 = LOOT.GetTypeForID(arg_1_0._unlockIDs[var_1_0])

	if var_1_2 == LOOT.itemTypes.WEAPON then
		var_1_1 = SOUND_SETS.aarrewards.weaponUnlocks
	elseif var_1_2 == LOOT.itemTypes.PERK then
		var_1_1 = SOUND_SETS.aarrewards.perkRankUp
	elseif var_1_2 == LOOT.itemTypes.STREAK then
		var_1_1 = SOUND_SETS.aarrewards.killstreakUnlock
	elseif var_1_2 == LOOT.itemTypes.EQUIPMENT then
		var_1_1 = SOUND_SETS.aarrewards.equipmentRankUp
	end

	Engine.BJDBIAGIDA(var_1_1)
end

local function var_0_5(arg_2_0, arg_2_1)
	local var_2_0

	local function var_2_1()
		if arg_2_0._unlockAnimationCounter <= #arg_2_0.unlockWidgets then
			local var_3_0 = arg_2_0.unlockWidgets[arg_2_0._unlockAnimationCounter]

			ACTIONS.AnimateSequence(var_3_0, "ShowNameAndType")
			var_0_4(arg_2_0)
			var_3_0:SetAlpha(0)
			var_3_0:SetAlpha(1, var_0_2)

			arg_2_0._unlockAnimationCounter = arg_2_0._unlockAnimationCounter + 1
			arg_2_0:Wait(var_0_2 / 2).onComplete = function()
				return var_2_1()
			end
		end
	end

	var_2_1()
end

local function var_0_6(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._unlockIDs = arg_5_2
	arg_5_0._curLineDisplayed = 1
	arg_5_0._unlockAnimationCounter = 1

	if arg_5_0._unlockIDs and #arg_5_0._unlockIDs > 0 then
		local var_5_0 = math.min(#arg_5_0._unlockIDs, AAR.MAX_UNLOCK_DISPLAY_NUM)

		local function var_5_1(arg_6_0)
			for iter_6_0 = #arg_5_0.unlockWidgets, 1, -1 do
				if iter_6_0 > var_5_0 then
					arg_5_0.unlocksList:RemoveElement(arg_5_0.unlockWidgets[iter_6_0])
					table.remove(arg_5_0.unlockWidgets)
				end
			end

			for iter_6_1 = 1, var_5_0 do
				local var_6_0 = arg_5_0.unlockWidgets[iter_6_1]

				if var_6_0 then
					ACTIONS.AnimateSequence(var_6_0, "Hide")
					var_6_0:UpdateUnlockData(arg_5_1, arg_5_0._unlockIDs[arg_6_0], true)

					arg_6_0 = arg_6_0 + 1
				else
					local var_6_1 = MenuBuilder.BuildRegisteredType("WZUnlocksLootItem", {
						isAARUnlock = true,
						controllerIndex = arg_5_1
					})

					var_6_1:UpdateUnlockData(arg_5_1, arg_5_0._unlockIDs[arg_6_0], true)

					arg_6_0 = arg_6_0 + 1

					arg_5_0.unlocksList:addElement(var_6_1)
					table.insert(arg_5_0.unlockWidgets, var_6_1)
				end
			end
		end

		var_5_1(1)

		if #arg_5_0._unlockIDs > AAR.MAX_UNLOCK_DISPLAY_NUM then
			local function var_5_2()
				arg_5_0._curLineDisplayed = arg_5_0._curLineDisplayed + 1
				arg_5_0._unlockAnimationCounter = 1

				if arg_5_0._curLineDisplayed == 2 then
					if #arg_5_0._unlockIDs <= AAR.MAX_UNLOCK_DISPLAY_NUM * 2 then
						var_5_0 = #arg_5_0._unlockIDs - AAR.MAX_UNLOCK_DISPLAY_NUM
					else
						var_5_0 = AAR.MAX_UNLOCK_DISPLAY_NUM
					end

					var_5_1(AAR.MAX_UNLOCK_DISPLAY_NUM + 1)
					var_0_5(arg_5_0, arg_5_1)
				else
					var_5_0 = #arg_5_0._unlockIDs - AAR.MAX_UNLOCK_DISPLAY_NUM * 2

					var_5_1(AAR.MAX_UNLOCK_DISPLAY_NUM * 2 + 1)
					var_0_5(arg_5_0, arg_5_1)
				end
			end

			arg_5_0:Wait(var_0_3 + var_0_0).onComplete = function()
				var_5_2()

				if #arg_5_0._unlockIDs > AAR.MAX_UNLOCK_DISPLAY_NUM * 2 then
					arg_5_0:Wait(var_0_3).onComplete = var_5_2
				end
			end
		end
	end
end

local function var_0_7(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0._unlockIDs and #arg_9_0._unlockIDs > 0
	local var_9_1 = var_0_0

	if var_9_0 then
		local var_9_2 = math.min(#arg_9_0._unlockIDs, AAR.MAX_UNLOCKS)

		var_9_1 = 1000 + var_0_0 + var_9_2 * var_0_2
	end

	ACTIONS.AnimateSequence(arg_9_0.RankUpItem, "Intro")
	arg_9_0.Cinematic:SetAlpha(1)
	Engine.DFCGFCGBFD("mp_aar_rankup")

	arg_9_0:Wait(450).onComplete = function()
		Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.playerRankUp)
	end
	arg_9_0:Wait(var_0_0).onComplete = function()
		arg_9_0.Cinematic:SetAlpha(0)
		Engine.EBCGADABJ()

		if var_9_0 then
			arg_9_0.unlocksList:SetAlpha(1)
			var_0_5(arg_9_0, arg_9_1)
		end
	end

	return var_9_1
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = 120
	local var_12_1, var_12_2, var_12_3, var_12_4 = arg_12_0.RankUpItem.RankValue:getLocalRect()

	arg_12_0.RankUpItem.RankValue:SetAnchorsAndPosition(0.5, 0.5, 1, 0, var_12_1, var_12_3, -var_12_0 * _1080p, 0)
	arg_12_0.RankUpItem.RankValue:SetFontSize(var_12_0 * _1080p)
	arg_12_0.RankUpItem.RankValue:setText(arg_12_2.rankDisplay)

	if arg_12_2.prestigeMasterColor ~= PROGRESSION.PRESTIGE_MASTER_INVALID_COLOR then
		arg_12_0.RankUpItem.RankValue:SetRGBFromTable(arg_12_2.prestigeMasterColor)
	end

	if arg_12_2.rankIcon and #arg_12_2.rankIcon > 0 then
		arg_12_0.RankUpItem.RankIcon:setImage(RegisterMaterial(arg_12_2.rankIcon))
	end

	if arg_12_3 then
		local var_12_5 = var_0_7(arg_12_0, arg_12_1)

		arg_12_0:Wait(var_12_5).onComplete = function()
			arg_12_0.unlocksList:SetAlpha(0)
			arg_12_0:dispatchEventToCurrentMenu({
				name = AAR.PARADE_PROGRESS_DONE
			})
		end
	end
end

local function var_0_9(arg_14_0, arg_14_1)
	local var_14_0 = var_0_1

	ACTIONS.AnimateSequence(arg_14_0.RankUpItem, "Intro")
	arg_14_0.Cinematic:SetAlpha(1)
	Engine.DFCGFCGBFD("mp_aar_rankup")
	Engine.BJDBIAGIDA(SOUND_SETS.aarrewards.playerRankUp)

	arg_14_0:Wait(var_14_0).onComplete = function()
		arg_14_0.Cinematic:SetAlpha(0)
		Engine.EBCGADABJ()
	end

	return var_14_0
end

local function var_0_10(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = 50
	local var_16_1, var_16_2, var_16_3, var_16_4 = arg_16_0.RankUpItem.RankValue:getLocalRect()

	arg_16_0.RankUpItem.RankValue:SetAnchorsAndPosition(0.5, 0.5, 1, 0, var_16_1, var_16_3, -var_16_0 * _1080p, 0)
	arg_16_0.RankUpItem.RankValue:SetFontSize(var_16_0 * _1080p)
	arg_16_0.RankUpItem.RankValue:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/SEASONAL_RANKS_UNLOCKED")))
	arg_16_0.RankUpItem.RankIcon:setImage(RegisterMaterial(PROGRESSION.GetPrestigeIcon(arg_16_2)))

	local var_16_5 = var_0_9(arg_16_0, arg_16_1)

	arg_16_0:Wait(var_16_5).onComplete = function()
		arg_16_0.unlocksList:SetAlpha(0)
		arg_16_0:dispatchEventToCurrentMenu({
			name = AAR.PARADE_ELDER_RANK_INTRO_DONE
		})
	end
end

function PostLoadFunc(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0._unlockAnimationCounter = 1
	arg_18_0.PlayAARRankUpSequence = var_0_8
	arg_18_0.PlayAARElderRankIntroSequence = var_0_10
	arg_18_0.SetupAARUnlocksList = var_0_6
	arg_18_0._curLineDisplayed = 1

	local var_18_0 = 16 * _1080p
	local var_18_1 = -656 * _1080p
	local var_18_2 = 656 * _1080p
	local var_18_3 = -286 * _1080p
	local var_18_4 = 113 * _1080p
	local var_18_5 = LUI.UIHorizontalList.new()

	var_18_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_18_1, var_18_2, var_18_3, var_18_4)
	var_18_5:SetAlignment(LUI.Alignment.Center)
	var_18_5:SetSpacing(var_18_0)

	var_18_5.id = "unlockList"

	var_18_5:SetNoWrap(true)
	arg_18_0:addElement(var_18_5)

	arg_18_0.unlocksList = var_18_5

	arg_18_0.unlocksList:SetAlpha(0)

	arg_18_0.unlockWidgets = {}
end

function AARRankUpContainer(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_19_0.id = "AARRankUpContainer"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "Cinematic"

	var_19_4:SetAlpha(0, 0)
	var_19_0:addElement(var_19_4)

	var_19_0.Cinematic = var_19_4

	local var_19_5
	local var_19_6 = MenuBuilder.BuildRegisteredType("AARRankUpItem", {
		controllerIndex = var_19_1
	})

	var_19_6.id = "RankUpItem"

	var_19_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -180, _1080p * 180, _1080p * -355, _1080p * 159)
	var_19_0:addElement(var_19_6)

	var_19_0.RankUpItem = var_19_6

	PostLoadFunc(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("AARRankUpContainer", AARRankUpContainer)
LockTable(_M)
