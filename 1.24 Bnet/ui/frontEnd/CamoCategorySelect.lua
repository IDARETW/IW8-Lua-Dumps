module(..., package.seeall)

local var_0_0 = "special"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = StringTable.BFHCAIIDA(CSV.camoTable.file)

	for iter_1_0 = 0, var_1_1 - 1 do
		local var_1_2 = CSV.ReadRow(CSV.camoTable, iter_1_0)

		if var_1_2.category == arg_1_1 then
			local var_1_3 = LOOT.GetItemID(LOOT.itemTypes.CAMO, var_1_2.ref)
			local var_1_4 = LOOT.IsUnlockedWithID(arg_1_0._controllerIndex, var_1_3)
			local var_1_5 = LOOT.GetItemID(LOOT.itemTypes.CAMO, var_1_2.ref, {
				weaponRef = arg_1_0._weaponTable.weapon
			})

			if not arg_1_2 or var_1_4 then
				var_1_2.unlockInfo = {
					lootID = var_1_5,
					unlocked = var_1_4,
					lockedText = lockedText
				}

				table.insert(var_1_0, var_1_2)
			end
		end
	end

	return var_1_0
end

local function var_0_2(arg_2_0)
	local var_2_0 = arg_2_0._weaponTable.weapon
	local var_2_1 = CSV.ReadRow(CSV.camoTable, 0)

	var_2_1.unlockInfo = {}
	var_2_1.unlockInfo.unlocked = true

	local var_2_2 = {}
	local var_2_3 = CSV.gunsmithProgressionTable
	local var_2_4 = var_2_3:GetFile(var_2_0)
	local var_2_5 = StringTable.BFHCAIIDA(var_2_4)

	for iter_2_0 = 0, var_2_5 - 1 do
		local var_2_6 = 0
		local var_2_7 = CSV.ReadRowWithFile(var_2_3, var_2_4, iter_2_0)
		local var_2_8 = var_2_7.level
		local var_2_9 = {}

		while var_2_7.lootID and #var_2_7.lootID > 0 or #var_2_9 > 0 do
			local var_2_10

			if #var_2_9 > 0 then
				var_2_10 = table.remove(var_2_9, 1)
			else
				var_2_10 = var_2_7.lootID

				if var_2_10 and string.match(var_2_10, "|") then
					var_2_9 = split(var_2_10, "|")
				end
			end

			local var_2_11 = tonumber(var_2_10)

			if var_2_11 and var_2_11 >= LOOT.CamoIDsMin and var_2_11 <= LOOT.CamoIDsMax then
				local var_2_12 = LOOT.GetItemRef(LOOT.itemTypes.CAMO, var_2_11, {
					weaponRef = var_2_0
				})

				if var_2_12 and #var_2_12 > 0 then
					local var_2_13 = StringTable.BJJBBCJGEJ(CSV.camoTable.file, CSV.camoTable.cols.ref, var_2_12)
					local var_2_14 = CSV.ReadRow(CSV.camoTable, var_2_13)

					var_2_14.unlockInfo = LUI.ShallowCopy(var_2_7)
					var_2_14.unlockInfo.lootID = var_2_11

					if #var_2_14.unlockInfo.challengeID > 0 then
						var_2_14.unlockInfo.progress = Gunsmith.CEFIIHJEFG(arg_2_0._controllerIndex, tonumber(var_2_14.unlockInfo.challengeID)).progress
					end

					var_2_14.unlockInfo.unlocked = LOOT.IsUnlockedWithID(arg_2_0._controllerIndex, var_2_14.unlockInfo.lootID)

					if not var_2_2[var_2_14.category] then
						var_2_2[var_2_14.category] = {}

						table.insert(var_2_2[var_2_14.category], var_2_1)
					end

					table.insert(var_2_2[var_2_14.category], var_2_14)
				end
			end

			if next(var_2_9) == nil then
				var_2_6 = var_2_6 + 1

				local var_2_15 = var_2_3.colOffset * var_2_6
				local var_2_16 = {
					lootID = var_2_3.cols.lootID + var_2_15,
					challengeID = var_2_3.cols.challengeID + var_2_15,
					challengeRef = var_2_3.cols.challengeRef + var_2_15
				}

				var_2_7 = CSV.ReadRowWithFileAndColumns(var_2_4, iter_2_0, var_2_16)
				var_2_7.level = var_2_8
			end
		end
	end

	local var_2_17 = var_0_1(arg_2_0, var_0_0, true)

	if var_2_17 then
		for iter_2_1 = 1, #var_2_17 do
			local var_2_18 = var_2_17[iter_2_1]

			if not var_2_2[var_2_18.category] then
				var_2_2[var_2_18.category] = {}

				table.insert(var_2_2[var_2_18.category], var_2_1)
			end

			table.insert(var_2_2[var_2_18.category], var_2_18)
		end
	end

	local var_2_19 = {}
	local var_2_20 = 0
	local var_2_21 = false
	local var_2_22 = StringTable.BFHCAIIDA(CSV.camoCategoryTable.file)

	for iter_2_2 = 1, var_2_22 - 1 do
		local var_2_23 = CSV.ReadRow(CSV.camoCategoryTable, iter_2_2)

		if var_2_2[var_2_23.ref] then
			var_2_20 = var_2_20 + 1

			if var_2_23.ref == arg_2_0._equippedCamoCategory then
				arg_2_0._defaultGridIndex = var_2_20 - 1
			end

			table.insert(var_2_19, var_2_23)
		end
	end

	local var_2_24 = CSV.ReadRow(CSV.camoCategoryTable, 0)

	if var_2_2[var_2_24.ref] then
		if var_0_0 == arg_2_0._equippedCamoCategory then
			arg_2_0._defaultGridIndex = var_2_20
		end

		table.insert(var_2_19, var_2_24)
	end

	arg_2_0._categoryTable = var_2_19
	arg_2_0._camoTable = var_2_2
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0

	if arg_3_0._camoTable[arg_3_2] then
		var_3_0 = arg_3_0._camoTable[arg_3_2][2]
	end

	if var_3_0 and not var_3_0.unlockInfo.unlocked then
		local var_3_1
		local var_3_2 = var_3_0.unlockInfo.challengeID

		if var_3_2 and #var_3_2 > 0 then
			local var_3_3 = StringTable.BJJBBCJGEJ(CSV.gunsmithChallenges.file, CSV.gunsmithChallenges.cols.id, var_3_2)
			local var_3_4 = CSV.ReadRow(CSV.gunsmithChallenges, var_3_3)

			var_3_1 = Engine.CBBHFCGDIC(var_3_4.desc)
		else
			var_3_1 = PROGRESSION.GetUnlockTextWithRank(var_3_0.unlockInfo.level)
		end

		arg_3_1.Description:setText(var_3_1)
		arg_3_1:SetButtonDisabled(true)
	elseif not var_3_0 then
		assert(var_3_0 ~= nil, "WARNING: Missing camos for category " .. arg_3_2 .. ". Ensure progression data is properly set up for the current weapon.")
		arg_3_1:SetButtonDisabled(true)
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.CamoCategoryButtonGrid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_4_0.CamoCategoryButtonGrid:GetContentIndex(arg_5_1, arg_5_2)
		local var_5_1 = arg_4_0._categoryTable[var_5_0 + 1]
		local var_5_2 = var_5_1.name
		local var_5_3 = arg_4_0._camoTable[var_5_1.ref][2].image
		local var_5_4 = var_5_1.ref == arg_4_0._equippedCamoCategory

		ACTIONS.AnimateSequence(arg_5_0.EquippedNotification, var_5_4 and "On" or "Off")
		ACTIONS.AnimateSequence(arg_5_0, var_5_4 and "EquippedAndNew" or "NotEquippedAndNew")

		if var_5_4 then
			var_5_3 = WEAPON.GetCamoImage(arg_4_0._equippedCamo)
		end

		arg_5_0.Category:setText(Engine.CBBHFCGDIC(var_5_2))
		arg_5_0.Image:setImage(RegisterMaterial(var_5_3))

		if not arg_5_0._handlerAdded then
			arg_5_0._handlerAdded = true

			arg_5_0:addEventHandler("button_action", function(arg_6_0, arg_6_1)
				local var_6_0 = {
					weaponSlot = arg_4_2,
					loadoutIndex = arg_4_1,
					camoTable = arg_4_0._camoTable[var_5_1.ref],
					category = Engine.CBBHFCGDIC(var_5_2)
				}

				LUI.FlowManager.RequestAddMenu("CamoSelect", true, arg_6_1.controller, nil, var_6_0, true)
			end)
		end

		local var_5_5 = false
		local var_5_6 = arg_4_0._camoTable[var_5_1.ref]
		local var_5_7 = 0

		if var_5_6 then
			for iter_5_0, iter_5_1 in ipairs(var_5_6) do
				if iter_5_0 > 1 then
					local var_5_8 = iter_5_1.unlockInfo.lootID

					if Loot.HDJCADADF(arg_4_0._controllerIndex, var_5_8) then
						var_5_5 = true
					end

					if iter_5_1.unlockInfo.unlocked then
						var_5_7 = var_5_7 + 1
					end
				end
			end
		end

		arg_5_0:UpdateBreadcrumb(var_5_5)
		arg_5_0.Description:setText(Engine.CBBHFCGDIC("CAS/GUNSMITH_UNLOCKS", var_5_7, #var_5_6 - 1))
		var_0_3(arg_4_0, arg_5_0, var_5_1.ref)
	end)
	arg_4_0.CamoCategoryButtonGrid:SetNumChildren(#arg_4_0._categoryTable)
	arg_4_0.CamoCategoryButtonGrid:RefreshContent()

	local var_4_0 = arg_4_0.CamoCategoryButtonGrid:GetPositionForIndex(arg_4_0._defaultGridIndex or 0)

	arg_4_0.CamoCategoryButtonGrid:SetDefaultFocus(var_4_0)
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_0.MenuTitle)
	assert(arg_7_0.CamoCategoryButtonGrid)
	arg_7_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CAMO_CATEGORY_TITLE"))

	arg_7_0._controllerIndex = arg_7_1

	if Engine.BHICADFIHA() then
		if not arg_7_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_7_2.loadoutIndex = 0
		end

		if not arg_7_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_7_2.weaponSlot = 0
		end
	end

	assert(arg_7_2.loadoutIndex)
	assert(arg_7_2.weaponSlot)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_7_0.weaponModel = WEAPON.GetWeaponModel(arg_7_1, FrontEndScene.ClientWeapons.Preview)

	arg_7_0:addElement(arg_7_0.weaponModel)

	local var_7_0 = PlayerData.BFFBGAJGD(arg_7_0._controllerIndex, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_7_2.loadoutIndex].weaponSetups[arg_7_2.weaponSlot]

	arg_7_0._weaponTable = WEAPON.GenerateWeaponTable(var_7_0)

	WEAPON.SetPreviewSceneForWeapon(arg_7_0._weaponTable.weapon)

	arg_7_0._equippedCamo = arg_7_0._weaponTable.camo
	arg_7_0._equippedCamoCategory = WEAPON.GetCamoCategory(arg_7_0._equippedCamo)

	var_0_2(arg_7_0)
	var_0_4(arg_7_0, arg_7_2.loadoutIndex, arg_7_2.weaponSlot)

	local var_7_1 = WEAPON.GetCamoName(arg_7_0._equippedCamo)

	arg_7_0.CamoPanel.Name:setText(ToUpperCase(Engine.CBBHFCGDIC(var_7_1)))

	local var_7_2 = arg_7_0._equippedCamo ~= WEAPON.CamoNoneValue

	arg_7_0.CamoPanel:SetAlpha(var_7_2 and 1 or 0)

	if var_7_2 then
		ACTIONS.AnimateSequence(arg_7_0.CamoPanel, "EquippedNoChallenge")
	end

	if Engine.DDJFBBJAIG() then
		local var_7_3 = WEAPON.GenerateWeaponTable(var_7_0)
		local var_7_4 = WEAPON.GetWeaponModelName(var_7_3.weapon, var_7_3, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_7_1
		})

		FrontEndScene.RequestWeaponViewModels({
			var_7_4
		}, arg_7_1)
		WEAPON.SetModelIfLoaded(arg_7_1, arg_7_0.weaponModel, var_7_4)
	end

	arg_7_0.bindButton:addEventHandler("button_right_stick", function(arg_8_0, arg_8_1)
		local var_8_0 = {
			weaponTable = arg_7_0._weaponTable
		}

		LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_8_1.controller, nil, var_8_0, true)

		if arg_8_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end
	end)
	arg_7_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/REMOVE_CAMO")
	})
	arg_7_0.bindButton:addEventHandler("button_alt1", function(arg_9_0, arg_9_1)
		WEAPON.SetEquippedCamo(var_7_0, WEAPON.CamoNoneValue)
		arg_7_0.CamoPanel:SetAlpha(0)

		if Engine.DDJFBBJAIG() then
			local var_9_0 = WEAPON.GenerateWeaponTable(var_7_0)

			var_9_0.camo = WEAPON.CamoNoneValue
			arg_7_0._weaponTable.camo = WEAPON.CamoNoneValue

			local var_9_1 = WEAPON.GetWeaponModelName(var_9_0.weapon, var_9_0, {
				includeCamos = true,
				includeAttachments = true,
				includeStickers = true,
				controllerIndex = arg_7_0._controllerIndex
			})

			FrontEndScene.RequestWeaponViewModels({
				var_9_1
			}, arg_7_0._controllerIndex)
			WEAPON.SetModelIfLoaded(arg_7_0._controllerIndex, arg_7_0.weaponModel, var_9_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.action)
			arg_7_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt1"
			})

			arg_7_0._equippedCamoCategory = "default"

			arg_7_0.CamoCategoryButtonGrid:RefreshContent()
		end
	end)

	local var_7_5 = var_7_0.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_7_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_7_0.GunsmithWeaponLevel:Setup(arg_7_1, var_7_5)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_7_0.TabBacker)
end

function CamoCategorySelect(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "CamoCategorySelect"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3

	if CONDITIONS.InGame(var_10_0) then
		local var_10_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_10_1
		})

		var_10_4.id = "InGameMenuBackground"

		var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_10_0:addElement(var_10_4)

		var_10_0.InGameMenuBackground = var_10_4
	end

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "TabBacker"

	var_10_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_10_0:addElement(var_10_6)

	var_10_0.TabBacker = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "MenuTitle"

	var_10_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CAMO_CATEGORY_TITLE")), 0)
	var_10_8.Line:SetLeft(0, 0)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_10_0:addElement(var_10_8)

	var_10_0.MenuTitle = var_10_8

	local var_10_9
	local var_10_10 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 5,
		maxVisibleRows = 2,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CamoCategoryButton", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 301,
		rowHeight = _1080p * 112,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_11 = LUI.UIGrid.new(var_10_10)

	var_10_11.id = "CamoCategoryButtonGrid"

	var_10_11:setUseStencil(true)
	var_10_11:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 96, _1080p * 1706, _1080p * -345, _1080p * -101)
	var_10_0:addElement(var_10_11)

	var_10_0.CamoCategoryButtonGrid = var_10_11

	local var_10_12
	local var_10_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_10_1
	})

	var_10_13.id = "LobbyStatus"

	var_10_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_10_0:addElement(var_10_13)

	var_10_0.LobbyStatus = var_10_13

	local var_10_14
	local var_10_15 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_10_1
	})

	var_10_15.id = "VerticalMinimalScrollbar"

	var_10_15:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1706, _1080p * 1717, _1080p * -345, _1080p * -101)
	var_10_0:addElement(var_10_15)

	var_10_0.VerticalMinimalScrollbar = var_10_15

	local var_10_16
	local var_10_17 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_10_1
	})

	var_10_17.id = "GunsmithWeaponLevel"

	var_10_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_10_0:addElement(var_10_17)

	var_10_0.GunsmithWeaponLevel = var_10_17

	local var_10_18
	local var_10_19 = MenuBuilder.BuildRegisteredType("WeaponCustomizationPanel", {
		controllerIndex = var_10_1
	})

	var_10_19.id = "CamoPanel"

	var_10_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 200, _1080p * 480)
	var_10_0:addElement(var_10_19)

	var_10_0.CamoPanel = var_10_19

	local var_10_20 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_10_15,
		startCap = var_10_15.startCap,
		endCap = var_10_15.endCap,
		sliderArea = var_10_15.sliderArea,
		slider = var_10_15.sliderArea and var_10_15.sliderArea.slider,
		fixedSizeSlider = var_10_15.sliderArea and var_10_15.sliderArea.fixedSizeSlider
	})

	var_10_11:AddScrollbar(var_10_20)
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})

	local var_10_21 = LUI.UIBindButton.new()

	var_10_21.id = "selfBindButton"

	var_10_0:addElement(var_10_21)

	var_10_0.bindButton = var_10_21

	var_10_0.bindButton:addEventHandler("button_secondary", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_10_1
		end

		ACTIONS.LeaveMenu(var_10_0)
	end)
	var_0_5(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("CamoCategorySelect", CamoCategorySelect)
LockTable(_M)
