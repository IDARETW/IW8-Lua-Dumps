module(..., package.seeall)

local var_0_0 = "GunsmithButton"

local function var_0_1(arg_1_0)
	for iter_1_0 = 1, GUNSMITH.maxCategories do
		if not arg_1_0._usedButtons[iter_1_0] then
			local var_1_0 = arg_1_0[var_0_0 .. iter_1_0]

			assert(var_1_0)
			var_1_0:closeTree()

			arg_1_0[var_0_0 .. iter_1_0] = nil
		end
	end

	arg_1_0._buttonsRemoved = true
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = GUNSMITH.maxCategories / 2
	local var_2_1 = arg_2_2 and 1 or math.ceil(var_2_0)
	local var_2_2 = arg_2_2 and math.ceil(var_2_0) or GUNSMITH.maxCategories
	local var_2_3 = arg_2_2 and math.ceil(var_2_0) or math.floor(var_2_0)

	for iter_2_0 = 0, var_2_3 do
		local var_2_4 = arg_2_1 - iter_2_0

		if var_2_4 < var_2_1 then
			var_2_4 = var_2_2
		end

		if arg_2_0._usedButtons[var_2_4] then
			return var_2_4
		end
	end
end

local function var_0_3(arg_3_0)
	local var_3_0 = 0

	for iter_3_0, iter_3_1 in ipairs(arg_3_0._weaponTable.attachments) do
		if iter_3_1.ref ~= ATTACHMENT.none then
			var_3_0 = var_3_0 + 1
		end
	end

	arg_3_0.EquippedCount.EquippedTxt:setText(Engine.CBBHFCGDIC("CAS/EQUIPPED_COUNT", var_3_0, ATTACHMENT.count))
	arg_3_0.EquippedCount:SetupCount(var_3_0)
end

local function var_0_4(arg_4_0)
	local var_4_0 = math.ceil(GUNSMITH.maxCategories / 2)

	for iter_4_0 = 1, GUNSMITH.maxCategories do
		if arg_4_0._usedButtons[iter_4_0] then
			local var_4_1 = arg_4_0[var_0_0 .. iter_4_0]

			var_4_1.navigation = var_4_1.navigation or {}

			if var_4_0 < iter_4_0 then
				local var_4_2 = iter_4_0 - var_4_0 + 1
				local var_4_3 = var_0_2(arg_4_0, var_4_2, true)

				if var_4_3 then
					var_4_1.navigation.up = arg_4_0[var_0_0 .. var_4_3]
				end
			else
				local var_4_4 = iter_4_0 + var_4_0

				if iter_4_0 ~= 1 then
					var_4_4 = var_4_4 - 1
				end

				local var_4_5 = var_0_2(arg_4_0, var_4_4, false)

				if var_4_5 then
					var_4_1.navigation.down = arg_4_0[var_0_0 .. var_4_5]
				end
			end
		end
	end

	arg_4_0._navigationSetup = true
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0 = GUNSMITH.GetBlockedCategories(arg_5_0._weaponTable)

	for iter_5_0, iter_5_1 in pairs(arg_5_0._usedButtons) do
		if iter_5_1 then
			local var_5_1 = arg_5_0[var_0_0 .. iter_5_0]

			assert(var_5_1)
			var_5_1:Setup(arg_5_1, iter_5_1, arg_5_0._attachments[iter_5_1], arg_5_0._weaponTable, var_5_0[iter_5_1])
		end
	end

	if not arg_5_0._buttonsRemoved then
		var_0_1(arg_5_0)
	end

	if not arg_5_0._navigationSetup then
		var_0_4(arg_5_0)
	end
end

local function var_0_6(arg_6_0)
	local var_6_0 = LUI.UIHorizontalNavigator.new()

	var_6_0.id = "topNavigator"

	arg_6_0:addElement(var_6_0)

	local var_6_1 = LUI.UIHorizontalNavigator.new()

	var_6_1.id = "bottomNavigator"

	arg_6_0:addElement(var_6_1)

	local var_6_2 = math.ceil(GUNSMITH.maxCategories / 2)

	for iter_6_0 = 1, GUNSMITH.maxCategories do
		local var_6_3 = var_6_2 < iter_6_0 and var_6_1 or var_6_0
		local var_6_4 = arg_6_0[var_0_0 .. iter_6_0]

		assert(var_6_4)
		arg_6_0:RemoveElement(var_6_4)
		var_6_3:addElement(var_6_4)
	end
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0._weaponTable = WEAPON.GenerateWeaponTable(arg_7_2)

	var_0_5(arg_7_0, arg_7_1)

	local var_7_0 = arg_7_0:getParent()

	if var_7_0 and var_7_0._weaponModel then
		WEAPON.LoadAndSetModel(arg_7_1, var_7_0._weaponModel, arg_7_0._weaponTable)
	end

	arg_7_0.WeaponAttributes:Setup(arg_7_0._weaponTable)
	var_0_3(arg_7_0)
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = LUI.FlowManager.GetScopedData(arg_8_0)

	if var_8_0.appearanceOptions then
		LUI.FlowManager.RequestAddMenu("AttachmentAppearanceSelect", true, arg_8_1.controller, false, var_8_0.appearanceOptions)
	end
end

local function var_0_9(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = LUI.UIBindButton.new()

	var_9_0.id = "selfBindButton"

	arg_9_0:addElement(var_9_0)

	arg_9_0.selfBindButton = var_9_0

	local function var_9_1(arg_10_0)
		local var_10_0 = LUI.FlowManager.GetScopedData(arg_10_0)

		if var_10_0.selectedIndex then
			GUNSMITH.EquipAttachment(nil, arg_9_1, ATTACHMENT.none, arg_9_2, {
				attachSlot = var_10_0.selectedIndex
			})
			var_0_7(arg_9_0, arg_9_1, arg_9_2)
		end
	end

	arg_9_0.selfBindButton:registerEventHandler("button_alt1", function(arg_11_0, arg_11_1)
		var_9_1(arg_11_0)
	end)
	arg_9_0:addEventHandler("contextual_menu_deselect_attachment", var_9_1)
	arg_9_0.selfBindButton:registerEventHandler("button_alt2", function(arg_12_0, arg_12_1)
		ATTACHMENT.ClearAllAttachments(arg_9_2)
		var_0_7(arg_9_0, arg_9_1, arg_9_2)
	end)

	local function var_9_2()
		if PROGRESSION.IsWeaponMaxLevel(arg_9_1, arg_9_0._weaponTable.weapon) or PROGRESSION.ShouldUnlockAll() then
			return
		end

		LUI.FlowManager.RequestPopupMenu(nil, "NextUnlocksPopup", true, arg_9_1, false, {
			weaponRef = arg_9_0._weaponTable.weapon,
			bucketItems = arg_9_0._bucketItems
		})
	end

	arg_9_0.selfBindButton:registerEventHandler("button_right_trigger", function(arg_14_0, arg_14_1)
		var_9_2()

		if arg_14_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_9_0.GunsmithProgress.kbmButton:addEventHandler("button_action", function(arg_15_0, arg_15_1)
		var_9_2()
	end)
	arg_9_0.selfBindButton:registerEventHandler("button_left_stick", function(arg_16_0, arg_16_1)
		var_0_8(arg_16_0, arg_16_1)
	end)
end

local function var_0_10(arg_17_0, arg_17_1, arg_17_2)
	assert(arg_17_0.WeaponAttributes)

	if Engine.BHICADFIHA() then
		if not arg_17_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for Gunsmith menu. Only OK after a MyChanges.")

			arg_17_2.loadoutIndex = 0
		end

		if not arg_17_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for Gunsmith menu. Only OK after a MyChanges.")

			arg_17_2.weaponSlot = 0
		end
	end

	assert(arg_17_2.loadoutPlayerData)
	assert(arg_17_2.weaponPlayerData)
	assert(arg_17_2.loadoutIndex)
	assert(arg_17_2.weaponSlot)

	local var_17_0 = arg_17_2.loadoutPlayerData
	local var_17_1 = arg_17_2.weaponPlayerData

	arg_17_0._weaponTable = WEAPON.GenerateWeaponTable(var_17_1)
	arg_17_0._attachments, arg_17_0._bucketItems = GUNSMITH.GetAttachmentsAndBucketItems(arg_17_1, arg_17_0._weaponTable.weapon, arg_17_0._weaponTable.lootID)
	arg_17_0._usedButtons = GUNSMITH.GetUsedAttachmentIndices(arg_17_0._weaponTable.weapon, arg_17_0._attachments)

	var_0_6(arg_17_0)
	var_0_5(arg_17_0, arg_17_1)
	arg_17_0.WeaponAttributes:Setup(arg_17_0._weaponTable)
	var_0_3(arg_17_0)

	if PROGRESSION.ShouldUnlockAll() then
		arg_17_0.GunsmithProgress:SetAlpha(0)
		arg_17_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_17_0.GunsmithProgress:Setup(arg_17_1, arg_17_0._bucketItems, arg_17_0._weaponTable.weapon)
		arg_17_0.GunsmithWeaponLevel:Setup(arg_17_1, arg_17_0._weaponTable.weapon)
	end

	var_0_9(arg_17_0, arg_17_1, var_17_1)

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_17_0, "CH")
	end
end

function GunsmithAttachments(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_18_0.id = "GunsmithAttachments"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3

	if CONDITIONS.InGame(var_18_0) then
		local var_18_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_18_1
		})

		var_18_4.id = "InGameMenuBackground"

		var_18_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_18_0:addElement(var_18_4)

		var_18_0.InGameMenuBackground = var_18_4
	end

	local var_18_5

	if not Engine.DDJFBBJAIG() then
		local var_18_6 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_18_1
		})

		var_18_6.id = "InGameMenuTimerStatus"

		var_18_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1473, _1080p * 1873, _1080p * 66, _1080p * 116)
		var_18_0:addElement(var_18_6)

		var_18_0.InGameMenuTimerStatus = var_18_6
	end

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "WeaponAttributes"

	var_18_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 95, _1080p * 507, _1080p * -263, _1080p * -103)
	var_18_0:addElement(var_18_8)

	var_18_0.WeaponAttributes = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "GunsmithButton1"

	var_18_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -955, _1080p * -515, _1080p * 251, _1080p * 315)
	var_18_0:addElement(var_18_10)

	var_18_0.GunsmithButton1 = var_18_10

	local var_18_11
	local var_18_12 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_12.id = "GunsmithButton2"

	var_18_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -579, _1080p * -139, _1080p * 227, _1080p * 291)
	var_18_0:addElement(var_18_12)

	var_18_0.GunsmithButton2 = var_18_12

	local var_18_13
	local var_18_14 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_14.id = "GunsmithButton3"

	var_18_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -220, _1080p * 220, _1080p * 199, _1080p * 263)
	var_18_0:addElement(var_18_14)

	var_18_0.GunsmithButton3 = var_18_14

	local var_18_15
	local var_18_16 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_16.id = "GunsmithButton4"

	var_18_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 139, _1080p * 579, _1080p * 227, _1080p * 291)
	var_18_0:addElement(var_18_16)

	var_18_0.GunsmithButton4 = var_18_16

	local var_18_17
	local var_18_18 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_18.id = "GunsmithButton5"

	var_18_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 498, _1080p * 938, _1080p * 251, _1080p * 315)
	var_18_0:addElement(var_18_18)

	var_18_0.GunsmithButton5 = var_18_18

	local var_18_19
	local var_18_20 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_20.id = "GunsmithButton6"

	var_18_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -448, _1080p * -8, _1080p * 817, _1080p * 881)
	var_18_0:addElement(var_18_20)

	var_18_0.GunsmithButton6 = var_18_20

	local var_18_21
	local var_18_22 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_22.id = "GunsmithButton7"

	var_18_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -122, _1080p * 318, _1080p * 846, _1080p * 910)
	var_18_0:addElement(var_18_22)

	var_18_0.GunsmithButton7 = var_18_22

	local var_18_23
	local var_18_24 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_24.id = "GunsmithButton8"

	var_18_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 188, _1080p * 628, _1080p * 847, _1080p * 911)
	var_18_0:addElement(var_18_24)

	var_18_0.GunsmithButton8 = var_18_24

	local var_18_25
	local var_18_26 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_18_1
	})

	var_18_26.id = "GunsmithButton9"

	var_18_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 498, _1080p * 938, _1080p * 817, _1080p * 881)
	var_18_0:addElement(var_18_26)

	var_18_0.GunsmithButton9 = var_18_26

	local var_18_27
	local var_18_28 = MenuBuilder.BuildRegisteredType("GunsmithEquippedSlots", {
		controllerIndex = var_18_1
	})

	var_18_28.id = "EquippedCount"

	var_18_28:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 462, _1080p * -299, _1080p * -267)
	var_18_0:addElement(var_18_28)

	var_18_0.EquippedCount = var_18_28

	local var_18_29

	if CONDITIONS.InFrontend(var_18_0) then
		local var_18_30 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_18_1
		})

		var_18_30.id = "LobbyMembersFooter"

		var_18_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_18_0:addElement(var_18_30)

		var_18_0.LobbyMembersFooter = var_18_30
	end

	local var_18_31
	local var_18_32 = MenuBuilder.BuildRegisteredType("GunsmithProgress", {
		controllerIndex = var_18_1
	})

	var_18_32.id = "GunsmithProgress"

	var_18_32:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -627, _1080p * -97, _1080p * 97, _1080p * 150)
	var_18_0:addElement(var_18_32)

	var_18_0.GunsmithProgress = var_18_32

	local var_18_33
	local var_18_34 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_18_1
	})

	var_18_34.id = "GunsmithWeaponLevel"

	var_18_34:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_18_0:addElement(var_18_34)

	var_18_0.GunsmithWeaponLevel = var_18_34

	local var_18_35
	local var_18_36 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_18_1
	})

	var_18_36.id = "CDLRestrictionTag"

	var_18_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
	var_18_0:addElement(var_18_36)

	var_18_0.CDLRestrictionTag = var_18_36

	local function var_18_37()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_37

	local function var_18_38()
		return
	end

	var_18_0._sequences.Modification = var_18_38

	local function var_18_39()
		return
	end

	var_18_0._sequences.HasModification = var_18_39

	local function var_18_40()
		return
	end

	var_18_0._sequences.ModifyWithModification = var_18_40

	local var_18_41
	local var_18_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -287
		}
	}

	var_18_28:RegisterAnimationSequence("CH", var_18_42)

	local function var_18_43()
		var_18_28:AnimateSequence("CH")
	end

	var_18_0._sequences.CH = var_18_43

	var_0_10(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("GunsmithAttachments", GunsmithAttachments)
LockTable(_M)
