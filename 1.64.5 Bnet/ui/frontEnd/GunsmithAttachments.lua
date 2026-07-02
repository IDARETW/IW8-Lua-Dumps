module(..., package.seeall)

local var_0_0 = "GunsmithButton"
local var_0_1 = GUNSMITH.maxCategories
local var_0_2 = {
	{
		1,
		6
	},
	{
		2,
		6
	},
	{
		3,
		7,
		10
	},
	{
		4,
		8
	},
	{
		5,
		9,
		11
	}
}

local function var_0_3(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0[var_0_0 .. arg_1_1]

	assert(var_1_0, "Could not find a button at the index: " .. arg_1_1)

	return var_1_0
end

local function var_0_4(arg_2_0, arg_2_1)
	return arg_2_0._usedButtons[arg_2_1] ~= nil
end

local function var_0_5(arg_3_0)
	for iter_3_0 = 1, GUNSMITH.maxCategories do
		if not var_0_4(arg_3_0, iter_3_0) then
			local var_3_0 = var_0_3(arg_3_0, iter_3_0)

			assert(var_3_0)
			var_3_0:closeTree()

			arg_3_0[var_0_0 .. iter_3_0] = nil
		end
	end

	arg_3_0._buttonsRemoved = true
end

local function var_0_6(arg_4_0)
	if arg_4_0._shouldDebugDynIcons == true and arg_4_0._weaponTable then
		local var_4_0 = WEAPON.GetWeaponModelName(arg_4_0._weaponTable.weapon, arg_4_0._weaponTable, {
			includeStickers = true,
			includeAttachments = true,
			keepAkimbo = true,
			includeCamos = true,
			controllerIndex = controllerIndex
		})
		local var_4_1 = DYN_ATTACHMENT.GetDynamicAttachmentsTable(var_4_0)

		arg_4_0.WeaponAttributes:SetAlpha(0)
		arg_4_0.DynamicWeaponIcon:SetAlpha(1)
		arg_4_0.DynamicWeaponIcon:PerformUpdate(controllerIndex, {
			isInteractive = false,
			attachmentsData = var_4_1,
			weaponRef = arg_4_0._weaponTable.weapon,
			weaponFullName = var_4_0
		})
	end
end

local function var_0_7(arg_5_0, arg_5_1)
	assert(arg_5_1 and type(arg_5_1) == "table" and arg_5_1.startCol and arg_5_1.startRow, "You must provide a table of options that contain the starting column and row of your search.")

	local var_5_0 = arg_5_1.isDirectionUp
	local var_5_1 = var_5_0 and arg_5_1.startRow - 1 or arg_5_1.startRow + 1
	local var_5_2 = var_5_0 and 0 or arg_5_1.useRowBounds and #arg_5_0._rowBounds or #arg_5_0._usedColumns[arg_5_1.startCol]

	for iter_5_0 = var_5_1, var_5_2, var_5_0 and -1 or 1 do
		local var_5_3 = arg_5_1.useRowBounds and arg_5_0._rowBounds[iter_5_0] or arg_5_0._usedColumns[arg_5_1.startCol][iter_5_0]

		if var_0_4(arg_5_0, var_5_3) then
			return var_0_3(arg_5_0, var_5_3)
		end
	end

	return nil
end

local function var_0_8(arg_6_0, arg_6_1)
	assert(arg_6_1 and type(arg_6_1) == "table" and arg_6_1.currentFocusedButton and arg_6_1.direction, "You must provide a table of options that contain the current button and the navigation direction.")

	local var_6_0 = arg_6_1.currentFocusedButton
	local var_6_1 = arg_6_1.direction
	local var_6_2 = var_6_0.buttonIndex == arg_6_0._rowBounds[var_6_0.column]
	local var_6_3 = #arg_6_0._rowBounds > 1
	local var_6_4 = var_6_0

	if not var_6_3 then
		return var_6_0
	end

	local var_6_5 = var_0_7(arg_6_0, {
		startCol = var_6_0.column,
		startRow = var_6_0.row,
		isDirectionUp = var_6_1 == "up"
	})

	if var_6_5 then
		return var_6_5
	end

	for iter_6_0 = var_6_0.column, #arg_6_0._usedColumns do
		if arg_6_0._usedColumns[iter_6_0] then
			local var_6_6 = var_0_7(arg_6_0, {
				startCol = iter_6_0,
				startRow = var_6_0.row,
				useRowBounds = var_6_2,
				isDirectionUp = var_6_1 == "up"
			})

			if var_6_6 then
				return var_6_6
			end
		end
	end

	return var_6_0
end

local function var_0_9(arg_7_0, arg_7_1)
	assert(arg_7_1 and type(arg_7_1 == "table" and arg_7_1.index and type(arg_7_1.index) == "number"), "You need to provide an options table with the index of the button with a button(s) below it.")

	local var_7_0 = var_0_3(arg_7_0, arg_7_1.index):IsAttachmentEquipped() and "Equipped" or "Empty"
	local var_7_1 = "GunsmithButton" .. arg_7_1.index .. var_7_0

	if arg_7_0._sequences and arg_7_0._sequences[var_7_1] then
		ACTIONS.AnimateSequence(arg_7_0, var_7_1)
	end
end

local function var_0_10(arg_8_0)
	local var_8_0 = {}

	arg_8_0._rowBounds = {}
	arg_8_0._usedColumns = {}

	for iter_8_0, iter_8_1 in ipairs(var_0_2) do
		local var_8_1 = {}

		for iter_8_2, iter_8_3 in ipairs(iter_8_1) do
			if var_0_4(arg_8_0, iter_8_3) then
				var_8_1[iter_8_2] = iter_8_3

				local var_8_2 = var_0_3(arg_8_0, iter_8_3)

				var_8_2.row = iter_8_2
				var_8_2.column = iter_8_0

				if not var_8_0[iter_8_2] then
					local var_8_3 = LUI.UIHorizontalNavigator.new()

					var_8_3.id = "navigator" .. iter_8_2

					var_8_3:SetNoWrap(true)
					arg_8_0:addElement(var_8_3)

					var_8_0[iter_8_2] = var_8_3
				end

				arg_8_0._rowBounds[iter_8_2] = iter_8_3
			end
		end

		arg_8_0._usedColumns[iter_8_0] = var_8_1
	end

	local var_8_4 = 1
	local var_8_5 = var_8_0[var_8_4]

	for iter_8_4 = 1, var_0_1 do
		local var_8_6 = var_0_3(arg_8_0, iter_8_4)

		assert(var_8_6)
		arg_8_0:RemoveElement(var_8_6)

		if iter_8_4 == arg_8_0._rowBounds[var_8_4] then
			if var_8_5 then
				var_8_5:addElement(var_8_6)

				var_8_4 = var_8_4 + 1

				if var_8_0[var_8_4] then
					var_8_5 = var_8_0[var_8_4]
				end
			end
		else
			var_8_5:addElement(var_8_6)
		end

		var_8_6:SetPromptPosition(var_8_4 == 2 and #arg_8_0._rowBounds > 2)

		if var_0_4(arg_8_0, iter_8_4) then
			local var_8_7 = var_0_3(arg_8_0, iter_8_4)

			var_8_7.navigation = var_8_7.navigation or {}
			var_8_7.navigation.up = var_0_8(arg_8_0, {
				direction = "up",
				currentFocusedButton = var_8_7
			})
			var_8_7.navigation.down = var_0_8(arg_8_0, {
				direction = "down",
				currentFocusedButton = var_8_7
			})
		end
	end

	arg_8_0._navigationSetup = true
end

local function var_0_11(arg_9_0, arg_9_1)
	local var_9_0 = GUNSMITH.GetBlockedCategories(arg_9_0._weaponTable)
	local var_9_1 = 1

	if not arg_9_0._navigationSetup then
		var_0_10(arg_9_0)
	end

	for iter_9_0, iter_9_1 in pairs(arg_9_0._usedButtons) do
		if iter_9_1 then
			local var_9_2 = var_0_3(arg_9_0, iter_9_0)

			assert(var_9_2)
			var_9_2:Setup(arg_9_1, {
				index = var_9_1,
				buttonIndex = iter_9_0,
				attachments = arg_9_0._attachments[iter_9_1],
				category = iter_9_1,
				weaponTable = arg_9_0._weaponTable,
				blockedCategory = var_9_0[iter_9_1]
			})

			var_9_1 = var_9_1 + 1

			var_0_9(arg_9_0, {
				index = iter_9_0
			})
		end
	end

	if not arg_9_0._buttonsRemoved then
		var_0_5(arg_9_0)
	end
end

local function var_0_12(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._weaponTable = WEAPON.GenerateWeaponTable(arg_10_2)

	var_0_11(arg_10_0, arg_10_1)

	local var_10_0 = arg_10_0:getParent()

	if var_10_0 and var_10_0._weaponModel then
		WEAPON.LoadAndSetModel(arg_10_1, var_10_0._weaponModel, arg_10_0._weaponTable)
	end

	arg_10_0.WeaponAttributes:Setup(arg_10_0._weaponTable)
	ATTACHMENT.SetupSlotDisplay(arg_10_0.EquippedCount, {
		weaponTable = arg_10_0._weaponTable
	})
	var_0_6(arg_10_0)
end

local function var_0_13(arg_11_0, arg_11_1)
	local var_11_0 = LUI.FlowManager.GetScopedData(arg_11_0)

	if var_11_0.appearanceOptions then
		LUI.FlowManager.RequestAddMenu("AttachmentAppearanceSelect", true, arg_11_1.controller, false, var_11_0.appearanceOptions)
	end
end

local function var_0_14(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = LUI.UIBindButton.new()

	var_12_0.id = "selfBindButton"

	arg_12_0:addElement(var_12_0)

	arg_12_0.selfBindButton = var_12_0

	local function var_12_1(arg_13_0)
		local var_13_0 = LUI.FlowManager.GetScopedData(arg_13_0)

		if var_13_0.selectedIndex then
			GUNSMITH.EquipAttachment(nil, arg_12_1, ATTACHMENT.none, arg_12_2, {
				attachSlot = var_13_0.selectedIndex
			})
			var_0_12(arg_12_0, arg_12_1, arg_12_2)
		end
	end

	arg_12_0.selfBindButton:registerEventHandler("button_alt1", function(arg_14_0, arg_14_1)
		var_12_1(arg_14_0)
	end)
	arg_12_0:addEventHandler("contextual_menu_deselect_attachment", var_12_1)
	arg_12_0.selfBindButton:registerEventHandler("button_alt2", function(arg_15_0, arg_15_1)
		ATTACHMENT.ClearAllAttachments(arg_12_2)
		var_0_12(arg_12_0, arg_12_1, arg_12_2)
	end)

	local function var_12_2()
		if PROGRESSION.IsWeaponMaxLevel(arg_12_1, arg_12_0._weaponTable.weapon) or PROGRESSION.ShouldUnlockAll() then
			return false
		end

		LUI.FlowManager.RequestPopupMenu(nil, "NextUnlocksPopup", true, arg_12_1, false, {
			weaponRef = arg_12_0._weaponTable.weapon,
			bucketItems = arg_12_0._bucketItems
		})

		return true
	end

	arg_12_0.selfBindButton:registerEventHandler("button_right_trigger", function(arg_17_0, arg_17_1)
		if var_12_2() and arg_17_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_12_0.GunsmithProgress.kbmButton:addEventHandler("button_action", function(arg_18_0, arg_18_1)
		var_12_2()
	end)
	arg_12_0.selfBindButton:registerEventHandler("button_left_stick", function(arg_19_0, arg_19_1)
		var_0_13(arg_19_0, arg_19_1)
	end)
end

local function var_0_15(arg_20_0, arg_20_1, arg_20_2)
	assert(arg_20_0.WeaponAttributes)

	if Engine.BHICADFIHA() then
		if not arg_20_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for Gunsmith menu. Only OK after a MyChanges.")

			arg_20_2.loadoutIndex = 0
		end

		if not arg_20_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for Gunsmith menu. Only OK after a MyChanges.")

			arg_20_2.weaponSlot = 0
		end
	end

	arg_20_0._shouldDebugDynIcons = CONDITIONS.DynamicIconDebugEnabled()

	assert(arg_20_2.loadoutPlayerData)
	assert(arg_20_2.weaponPlayerData)
	assert(arg_20_2.loadoutIndex)
	assert(arg_20_2.weaponSlot)

	local var_20_0 = arg_20_2.loadoutPlayerData
	local var_20_1 = arg_20_2.weaponPlayerData

	arg_20_0._weaponTable = WEAPON.GenerateWeaponTable(var_20_1)
	arg_20_0._attachments, arg_20_0._bucketItems = GUNSMITH.GetAttachmentsAndBucketItems(arg_20_1, arg_20_0._weaponTable.weapon, arg_20_0._weaponTable.lootID)
	arg_20_0._usedButtons = GUNSMITH.GetUsedAttachmentIndices(arg_20_0._weaponTable.weapon, arg_20_0._attachments)

	var_0_11(arg_20_0, arg_20_1)
	arg_20_0.WeaponAttributes:Setup(arg_20_0._weaponTable)
	ATTACHMENT.SetupSlotDisplay(arg_20_0.EquippedCount, {
		weaponTable = arg_20_0._weaponTable
	})

	if PROGRESSION.ShouldUnlockAll() then
		arg_20_0.GunsmithProgress:SetAlpha(0)
		arg_20_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_20_0.GunsmithProgress:Setup(arg_20_1, arg_20_0._bucketItems, arg_20_0._weaponTable.weapon)
		arg_20_0.GunsmithWeaponLevel:Setup(arg_20_1, arg_20_0._weaponTable.weapon)
	end

	var_0_14(arg_20_0, arg_20_1, var_20_1)

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_20_0, "CH")
	end

	if arg_20_0._shouldDebugDynIcons == true then
		arg_20_0.WeaponAttributes:SetAlpha(0)
		arg_20_0.EquippedCount:SetAlpha(0)
		arg_20_0.GunsmithProgress:SetAlpha(0)
		arg_20_0.GunsmithWeaponLevel:SetAlpha(0)

		local var_20_2
		local var_20_3 = MenuBuilder.BuildRegisteredType("WeaponWithAttachments", {
			controllerIndex = arg_20_1
		})

		var_20_3.id = "DynamicWeaponIcon"

		var_20_3:SetRGBFromInt(12566463, 0)
		var_20_3:SetScale(0.2, 0)
		var_20_3:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 65, _1080p * 525, _1080p * -350, _1080p * -122)
		arg_20_0:addElement(var_20_3)

		arg_20_0.DynamicWeaponIcon = var_20_3

		var_0_6(arg_20_0)
	end

	if CONDITIONS.IsWZWipFlowEnabled() and Engine.DDJFBBJAIG() then
		arg_20_0.WZWipSnipeBackgroundSceneOverlay:UpdateSnipeOverlay({
			useGunsmithSetup = true,
			weaponRef = arg_20_0._weaponTable.weapon
		})
	end
end

function GunsmithAttachments(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_21_0.id = "GunsmithAttachments"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	local var_21_2 = var_21_0
	local var_21_3

	if CONDITIONS.InGame() then
		local var_21_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_21_1
		})

		var_21_4.id = "InGameMenuBackground"

		var_21_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_21_0:addElement(var_21_4)

		var_21_0.InGameMenuBackground = var_21_4
	end

	local var_21_5

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_21_6 = MenuBuilder.BuildRegisteredType("WZSnipeBackgroundSceneOverlay", {
			controllerIndex = var_21_1
		})

		var_21_6.id = "WZWipSnipeBackgroundSceneOverlay"

		var_21_6:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_21_0:addElement(var_21_6)

		var_21_0.WZWipSnipeBackgroundSceneOverlay = var_21_6
	end

	local var_21_7

	if not Engine.DDJFBBJAIG() then
		local var_21_8 = MenuBuilder.BuildRegisteredType("InGameMenuTimerStatus", {
			controllerIndex = var_21_1
		})

		var_21_8.id = "InGameMenuTimerStatus"

		var_21_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1473, _1080p * 1873, _1080p * 66, _1080p * 116)
		var_21_0:addElement(var_21_8)

		var_21_0.InGameMenuTimerStatus = var_21_8
	end

	local var_21_9
	local var_21_10 = MenuBuilder.BuildRegisteredType("WeaponAttributes", {
		controllerIndex = var_21_1
	})

	var_21_10.id = "WeaponAttributes"

	var_21_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 95, _1080p * 507, _1080p * -263, _1080p * -103)
	var_21_0:addElement(var_21_10)

	var_21_0.WeaponAttributes = var_21_10

	local var_21_11
	local var_21_12 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_12.id = "GunsmithButton1"

	var_21_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -955, _1080p * -515, _1080p * 251, _1080p * 315)
	var_21_0:addElement(var_21_12)

	var_21_0.GunsmithButton1 = var_21_12

	local var_21_13
	local var_21_14 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_14.id = "GunsmithButton2"

	var_21_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -579, _1080p * -139, _1080p * 227, _1080p * 291)
	var_21_0:addElement(var_21_14)

	var_21_0.GunsmithButton2 = var_21_14

	local var_21_15
	local var_21_16 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_16.id = "GunsmithButton3"

	var_21_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -220, _1080p * 220, _1080p * 199, _1080p * 263)
	var_21_0:addElement(var_21_16)

	var_21_0.GunsmithButton3 = var_21_16

	local var_21_17
	local var_21_18 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_18.id = "GunsmithButton4"

	var_21_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 139, _1080p * 579, _1080p * 227, _1080p * 291)
	var_21_0:addElement(var_21_18)

	var_21_0.GunsmithButton4 = var_21_18

	local var_21_19
	local var_21_20 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_20.id = "GunsmithButton5"

	var_21_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 498, _1080p * 938, _1080p * 251, _1080p * 315)
	var_21_0:addElement(var_21_20)

	var_21_0.GunsmithButton5 = var_21_20

	local var_21_21
	local var_21_22 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_22.id = "GunsmithButton6"

	var_21_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -448, _1080p * -8, _1080p * 817, _1080p * 881)
	var_21_0:addElement(var_21_22)

	var_21_0.GunsmithButton6 = var_21_22

	local var_21_23
	local var_21_24 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_24.id = "GunsmithButton7"

	var_21_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -132, _1080p * 308, _1080p * 847, _1080p * 911)
	var_21_0:addElement(var_21_24)

	var_21_0.GunsmithButton7 = var_21_24

	local var_21_25
	local var_21_26 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_26.id = "GunsmithButton10"

	var_21_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -132, _1080p * 308, _1080p * 906, _1080p * 970)
	var_21_0:addElement(var_21_26)

	var_21_0.GunsmithButton10 = var_21_26

	local var_21_27
	local var_21_28 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_28.id = "GunsmithButton8"

	var_21_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 183, _1080p * 623, _1080p * 847, _1080p * 911)
	var_21_0:addElement(var_21_28)

	var_21_0.GunsmithButton8 = var_21_28

	local var_21_29
	local var_21_30 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_30.id = "GunsmithButton9"

	var_21_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 498, _1080p * 938, _1080p * 817, _1080p * 881)
	var_21_0:addElement(var_21_30)

	var_21_0.GunsmithButton9 = var_21_30

	local var_21_31
	local var_21_32 = MenuBuilder.BuildRegisteredType("GunsmithButton", {
		controllerIndex = var_21_1
	})

	var_21_32.id = "GunsmithButton11"

	var_21_32:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 498, _1080p * 938, _1080p * 875, _1080p * 939)
	var_21_0:addElement(var_21_32)

	var_21_0.GunsmithButton11 = var_21_32

	local var_21_33
	local var_21_34 = MenuBuilder.BuildRegisteredType("GunsmithEquippedSlots", {
		controllerIndex = var_21_1
	})

	var_21_34.id = "EquippedCount"

	var_21_34:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 130, _1080p * 462, _1080p * -299, _1080p * -267)
	var_21_0:addElement(var_21_34)

	var_21_0.EquippedCount = var_21_34

	local var_21_35

	if CONDITIONS.InFrontend() then
		local var_21_36 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_21_1
		})

		var_21_36.id = "LobbyMembersFooter"

		var_21_36:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_21_0:addElement(var_21_36)

		var_21_0.LobbyMembersFooter = var_21_36
	end

	local var_21_37
	local var_21_38 = MenuBuilder.BuildRegisteredType("GunsmithProgress", {
		controllerIndex = var_21_1
	})

	var_21_38.id = "GunsmithProgress"

	var_21_38:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -627, _1080p * -97, _1080p * 97, _1080p * 150)
	var_21_0:addElement(var_21_38)

	var_21_0.GunsmithProgress = var_21_38

	local var_21_39
	local var_21_40 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_21_1
	})

	var_21_40.id = "GunsmithWeaponLevel"

	var_21_40:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_21_0:addElement(var_21_40)

	var_21_0.GunsmithWeaponLevel = var_21_40

	local var_21_41
	local var_21_42 = MenuBuilder.BuildRegisteredType("CDLRestrictionTag", {
		controllerIndex = var_21_1
	})

	var_21_42.id = "CDLRestrictionTag"

	var_21_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1508, _1080p * 1824, _1080p * 170, _1080p * 200)
	var_21_0:addElement(var_21_42)

	var_21_0.CDLRestrictionTag = var_21_42

	local function var_21_43()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_43

	local function var_21_44()
		return
	end

	var_21_0._sequences.Modification = var_21_44

	local function var_21_45()
		return
	end

	var_21_0._sequences.HasModification = var_21_45

	local function var_21_46()
		return
	end

	var_21_0._sequences.ModifyWithModification = var_21_46

	local var_21_47
	local var_21_48 = {
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

	var_21_34:RegisterAnimationSequence("CH", var_21_48)

	local function var_21_49()
		var_21_34:AnimateSequence("CH")
	end

	var_21_0._sequences.CH = var_21_49

	local var_21_50
	local var_21_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 926
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 990
		}
	}

	var_21_26:RegisterAnimationSequence("GunsmithButton7Equipped", var_21_51)

	local function var_21_52()
		var_21_26:AnimateSequence("GunsmithButton7Equipped")
	end

	var_21_0._sequences.GunsmithButton7Equipped = var_21_52

	local var_21_53
	local var_21_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 906
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 970
		}
	}

	var_21_26:RegisterAnimationSequence("GunsmithButton7Empty", var_21_54)

	local function var_21_55()
		var_21_26:AnimateSequence("GunsmithButton7Empty")
	end

	var_21_0._sequences.GunsmithButton7Empty = var_21_55

	local var_21_56
	local var_21_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 896
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 960
		}
	}

	var_21_32:RegisterAnimationSequence("GunsmithButton9Equipped", var_21_57)

	local function var_21_58()
		var_21_32:AnimateSequence("GunsmithButton9Equipped")
	end

	var_21_0._sequences.GunsmithButton9Equipped = var_21_58

	local var_21_59
	local var_21_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 875
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 939
		}
	}

	var_21_32:RegisterAnimationSequence("GunsmithButton9Empty", var_21_60)

	local function var_21_61()
		var_21_32:AnimateSequence("GunsmithButton9Empty")
	end

	var_21_0._sequences.GunsmithButton9Empty = var_21_61

	var_0_15(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("GunsmithAttachments", GunsmithAttachments)
LockTable(_M)
