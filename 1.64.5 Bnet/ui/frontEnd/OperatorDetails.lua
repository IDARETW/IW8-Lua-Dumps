module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = {
		operatorFaction = arg_1_2
	}
	local var_1_1 = RANDOM.IsEnabled(arg_1_3, LOOT.itemTypes.OPERATOR, var_1_0)

	if arg_1_1.isRandom then
		arg_1_0.EquippedWidget:SetAlpha(var_1_1 and 1 or 0, 0)
	else
		local var_1_2 = PlayerData.BFFBGAJGD(arg_1_3, LOADOUT.GetLoadoutStatsGroup()).customizationSetup.operators[arg_1_2]:get() == arg_1_1.ref and not var_1_1

		if var_1_2 then
			ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
		end

		arg_1_0.EquippedWidget:SetAlpha(var_1_2 and 1 or 0, 0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	assert(arg_2_1.name)
	assert(arg_2_1.superfaction)

	local var_2_0 = OPERATOR.GetClientCharacterForSuperFaction(tonumber(arg_2_1.superfaction))
	local var_2_1
	local var_2_2 = false

	if arg_2_1.isRandom then
		arg_2_0.Name:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RANDOM")))

		var_2_1 = OPERATOR.GetOperatorSkin(arg_2_2, arg_2_1.lootIndex, arg_2_1.ref)
	else
		arg_2_0.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_2_1.name)))

		if RANDOM.IsEnabled(arg_2_2, LOOT.itemTypes.OPERATOR_SKIN, {
			operatorRef = arg_2_1.ref
		}) then
			var_2_1 = {
				bodyModel = OPERATOR.proxyBody,
				headModel = OPERATOR.proxyHead
			}

			local var_2_3 = true
		else
			var_2_1 = OPERATOR.GetEquippedSkinForOperator(arg_2_2, arg_2_1.ref)
		end

		local var_2_4 = OPERATOR.GetExecutionForOperator(arg_2_2, arg_2_1.ref)
		local var_2_5 = OPERATOR.GetPetCharacterForSuperFaction(operatorSuperfaction)

		OPERATOR.UpdatePet(arg_2_2, var_2_5, {
			idle = true,
			execution = var_2_4,
			element = arg_2_0
		})
	end

	local var_2_6, var_2_7 = OPERATOR.GetWeaponDataFromLoadout(arg_2_2)
	local var_2_8 = OPERATOR.GetWeaponAccessoryModelFromLoadout(arg_2_2)
	local var_2_9 = OPERATOR.ValidateAccessoryModel(var_2_8, var_2_1.bodyModel)
	local var_2_10 = WEAPON.GetWeaponDetailsFromModel(var_2_7)

	if not OPERATOR.IsStowedWeaponAllowedInPreviewScreens(var_2_10.weaponAsset) then
		var_2_7 = WEAPON.NoneValue
	end

	FrontEndScene.RequestWeaponWorldModels({
		var_2_6,
		var_2_7,
		var_2_9
	})

	local var_2_11 = {
		operatorPose = arg_2_3,
		element = arg_2_0,
		weaponModel = var_2_6,
		secondaryModel = var_2_7,
		showCharacter = arg_2_4,
		accessoryModel = var_2_9
	}

	OPERATOR.UpdateClientCharacter(var_2_0, var_2_1.bodyModel, var_2_1.headModel, var_2_11)
	ClientCharacter.DDHJHDEHFG(var_2_0, 0, 10, 0)

	if arg_2_5 == "OperatorShowcase" then
		ClientCharacter.DGGEBHHGJG(var_2_0, false)

		arg_2_0:Wait(50, true).onComplete = function()
			ClientCharacter.DGGEBHHGJG(var_2_0, true)
		end
	end

	local var_2_12 = operatorSuperfaction == OPERATOR.SuperFaction.WEST and "West" or "East"

	ACTIONS.AnimateSequence(arg_2_0, var_2_12)

	local var_2_13 = LOOT.GetItemID(LOOT.itemTypes.OPERATOR, arg_2_1.ref)

	arg_2_0.NewItemNotification:UpdateBreadcrumbByID(arg_2_2, var_2_13, true)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetOperatorDetails = var_0_1
	arg_4_0.UpdateEquippedWidget = var_0_0

	arg_4_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED"))
	arg_4_0.FactionIcon:SetMask(arg_4_0.FactionIconMask)

	if IsLanguageChinese() or IsLanguageKorean() or IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_4_0, "KORZHJP")
	end

	if not IsLanguageArabic() then
		arg_4_0.NewItemNotification:SetupLeftAlignment()
	end
end

function OperatorDetails(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 500 * _1080p)

	var_5_0.id = "OperatorDetails"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "FactionIcon"

	var_5_4:SetColorOpParam(0.03, 0)
	var_5_4:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * 225, _1080p * -273, _1080p * 177)
	var_5_0:addElement(var_5_4)

	var_5_0.FactionIcon = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "FactionIconMask"

	var_5_6:SetZRotation(-90, 0)
	var_5_6:SetColorOpParam(1, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_left_to_right_mask"), 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -308, _1080p * 308, _1080p * -200, _1080p * 244)
	var_5_0:addElement(var_5_6)

	var_5_0.FactionIconMask = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "SuperFactionName"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_5_8:setText("WEST", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * -170, _1080p * 170, _1080p * -171, _1080p * -111)
	var_5_0:addElement(var_5_8)

	var_5_0.SuperFactionName = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Name"

	var_5_10:SetRGBFromTable(SWATCHES.MainMenu.PrimaryTitleColor, 0)
	var_5_10:setText(ToUpperCase("GRAVES"), 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_10:SetWordWrap(false)
	var_5_10:SetAlignment(LUI.Alignment.Center)
	var_5_10:SetDecodeLetterLength(50)
	var_5_10:SetDecodeMaxRandChars(2)
	var_5_10:SetDecodeUpdatesPerLetter(10)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -242, _1080p * 242, _1080p * 376, _1080p * 446)
	var_5_0:addElement(var_5_10)

	var_5_0.Name = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "EquippedWidget"

	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -68, _1080p * 68, _1080p * 446, _1080p * 476)
	var_5_0:addElement(var_5_12)

	var_5_0.EquippedWidget = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("NewItemNotification", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "NewItemNotification"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -39, _1080p * 39, _1080p * 446, _1080p * 476)
	var_5_0:addElement(var_5_14)

	var_5_0.NewItemNotification = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 391
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 451
		}
	}

	var_5_10:RegisterAnimationSequence("KORZHJP", var_5_16)

	local var_5_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 456
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 486
		}
	}

	var_5_12:RegisterAnimationSequence("KORZHJP", var_5_17)

	local function var_5_18()
		var_5_10:AnimateSequence("KORZHJP")
		var_5_12:AnimateSequence("KORZHJP")
	end

	var_5_0._sequences.KORZHJP = var_5_18

	local var_5_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_east_large")
		}
	}

	var_5_4:RegisterAnimationSequence("East", var_5_19)

	local function var_5_20()
		var_5_4:AnimateSequence("East")
	end

	var_5_0._sequences.East = var_5_20

	local var_5_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_faction_west_large")
		}
	}

	var_5_4:RegisterAnimationSequence("West", var_5_21)

	local function var_5_22()
		var_5_4:AnimateSequence("West")
	end

	var_5_0._sequences.West = var_5_22

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("OperatorDetails", OperatorDetails)
LockTable(_M)
