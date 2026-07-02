module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0._editionButtons[arg_1_1]

	if not var_1_0.added then
		arg_1_0:addElement(var_1_0)

		var_1_0.added = true
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0._editionButtons[arg_2_1]

	if var_2_0.added then
		arg_2_0:RemoveElement(var_2_0)

		var_2_0.added = false
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._editionButtons = {
		arg_3_0.StandardEditionButton,
		arg_3_0.OperatorEditionButton,
		arg_3_0.OperatorEnhancedEditionButton
	}

	local var_3_0 = {
		"ShowThree",
		"ShowTwo",
		"ShowOne"
	}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0._editionButtons) do
		iter_3_1:setPriority(iter_3_0)

		iter_3_1.added = true

		iter_3_1:addEventHandler("button_over", function(arg_4_0, arg_4_1)
			if arg_4_0.menu then
				ACTIONS.AnimateSequence(arg_4_0.menu, var_3_0[iter_3_0])
			end
		end)
	end

	arg_3_0.AddButton = var_0_0
	arg_3_0.RemoveButton = var_0_1
end

function MPBattlenetStoreMenuButtons(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalList.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 646 * _1080p, 0, 320 * _1080p)

	var_5_0.id = "MPBattlenetStoreMenuButtons"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:SetSpacing(10 * _1080p)

	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("BattlenetStoreItemButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "OperatorEnhancedEditionButton"

	var_5_4.GameEditionImage.EditionImage:setImage(RegisterMaterial("keyart_operator_enhanced_edition_thumbnail"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -323, _1080p * 323, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.OperatorEnhancedEditionButton = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("BattlenetStoreItemButton", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "OperatorEditionButton"

	var_5_6.GameEditionImage.EditionImage:setImage(RegisterMaterial("keyart_operator_edition_thumbnail"), 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -323, _1080p * 323, _1080p * 110, _1080p * 210)
	var_5_0:addElement(var_5_6)

	var_5_0.OperatorEditionButton = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("BattlenetStoreItemButton", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "StandardEditionButton"

	var_5_8.GameEditionImage.EditionImage:setImage(RegisterMaterial("keyart_standard_edition_thumbnail"), 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -323, _1080p * 323, _1080p * 220, _1080p * 320)
	var_5_0:addElement(var_5_8)

	var_5_0.StandardEditionButton = var_5_8

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("MPBattlenetStoreMenuButtons", MPBattlenetStoreMenuButtons)
LockTable(_M)
