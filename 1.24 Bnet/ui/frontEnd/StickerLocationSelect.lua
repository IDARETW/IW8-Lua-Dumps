module(..., package.seeall)

local var_0_0 = {
	"placement_sticker_1",
	"placement_sticker_2",
	"placement_sticker_3",
	"placement_sticker_4"
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0 = arg_1_4.weapon:get()
	local var_1_1 = WEAPON.GetMaxStickerSlotsForWeapon(var_1_0)

	arg_1_0.StickerLocationButtonGrid:SetRefreshChild(function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_1_0.StickerLocationButtonGrid:GetContentIndex(arg_2_1, arg_2_2) + 1
		local var_2_1 = WEAPON.GetEquippedStickerForIndex(arg_1_4, var_2_0)
		local var_2_2
		local var_2_3

		if var_2_1 then
			local var_2_4 = var_2_1 == WEAPON.StickerNoneValue and Engine.CBBHFCGDIC("LUA_MENU/SLOT_N", var_2_0) or Engine.CBBHFCGDIC(WEAPON.GetStickerName(var_2_1))
			local var_2_5 = var_2_1 == WEAPON.StickerNoneValue and "customization_empty_slot" or WEAPON.GetStickerImage(var_2_1)

			arg_2_0.Category:setText(var_2_4)

			if var_2_5 ~= "" then
				arg_2_0:SetSelectedImage(var_2_5)
				arg_2_0.Image:SetAlpha(1)
			end
		else
			arg_2_0.Image:SetAlpha(0)
		end

		arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
			local var_3_0 = {
				weaponSlot = arg_1_3,
				loadoutIndex = arg_1_2,
				slotIndex = var_2_0
			}

			LUI.FlowManager.RequestAddMenu("StickerSelect", true, arg_1_1, nil, var_3_0, true)
		end)

		local var_2_6 = LOOT.IsCategoryNew(arg_1_1, LOOT.itemTypes.STICKER)

		arg_2_0:UpdateBreadcrumb(var_2_6)
	end)
	arg_1_0.StickerLocationButtonGrid:SetNumChildren(var_1_1)
	arg_1_0.StickerLocationButtonGrid:RefreshContent()
	arg_1_0.bindButton:addEventHandler("button_right_stick", function(arg_4_0, arg_4_1)
		local var_4_0 = {
			weaponTable = WEAPON.GenerateWeaponTable(arg_1_4)
		}

		LUI.FlowManager.RequestAddMenu("WeaponPreview", true, arg_1_1, nil, var_4_0, true)
	end)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.MenuTitle)
	assert(arg_5_0.StickerLocationButtonGrid)
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/STICKER_LOCATION_SELECT"))

	if Engine.BHICADFIHA() then
		if not arg_5_2.loadoutIndex then
			DebugPrint("WARNING: Missing \"loadoutIndex\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_5_2.loadoutIndex = 0
		end

		if not arg_5_2.weaponSlot then
			DebugPrint("WARNING: Missing \"weaponSlot\" option for WeaponCustomize menu. Only OK after a MyChanges.")

			arg_5_2.weaponSlot = 0
		end
	end

	assert(arg_5_2.loadoutIndex)
	assert(arg_5_2.weaponSlot)
	FrontEndScene.SetExclusiveWeaponModels({
		FrontEndScene.ClientWeapons.Preview
	})

	arg_5_0.weaponModel = WEAPON.GetWeaponModel(arg_5_1, FrontEndScene.ClientWeapons.Preview, CSV.weaponOffsets.attachmentFile)

	arg_5_0:addElement(arg_5_0.weaponModel)

	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts[arg_5_2.loadoutIndex].weaponSetups[arg_5_2.weaponSlot]

	if Engine.DDJFBBJAIG() then
		local var_5_1 = GUNSMITH.GetAttachmentCategoryScene(var_5_0.weapon:get(), var_5_0.variantID:get(), ATTACHMENT.stickerCategory)

		if var_5_1 then
			Engine.DHFCHIIJCA(var_5_1)
		end
	end

	local var_5_2 = WEAPON.GetMaxStickerSlotsForWeapon(var_5_0.weapon:get())

	if Engine.DDJFBBJAIG() then
		local var_5_3 = WEAPON.GenerateWeaponTable(var_5_0)
		local var_5_4 = WEAPON.GetEquippedStickers(var_5_0)

		if var_5_4 ~= nil then
			for iter_5_0 = 1, var_5_2 do
				local var_5_5 = var_5_4[iter_5_0] and var_5_4[iter_5_0]

				if not var_5_5 or #var_5_5 == 0 or var_5_5 == WEAPON.StickerNoneValue then
					var_5_3.stickers[iter_5_0] = var_0_0[iter_5_0]
				end
			end
		end

		local var_5_6 = WEAPON.GetWeaponModelName(var_5_3.weapon, var_5_3, {
			includeCamos = true,
			includeAttachments = true,
			includeStickers = true,
			controllerIndex = arg_5_1
		})

		FrontEndScene.RequestWeaponViewModels({
			var_5_6
		}, arg_5_1)
		WEAPON.SetModelIfLoaded(arg_5_1, arg_5_0.weaponModel, var_5_6)
	end

	var_0_1(arg_5_0, arg_5_1, arg_5_2.loadoutIndex, arg_5_2.weaponSlot, var_5_0)

	local var_5_7 = var_5_0.weapon:get()

	if PROGRESSION.ShouldUnlockAll() then
		arg_5_0.GunsmithWeaponLevel:SetAlpha(0)
	else
		arg_5_0.GunsmithWeaponLevel:Setup(arg_5_1, var_5_7)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.TabBacker)
end

function StickerLocationSelect(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "StickerLocationSelect"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	var_6_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})
	var_6_0.HelperBar.id = "HelperBar"

	var_6_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_6_0.HelperBar:setPriority(10)
	var_6_0:addElement(var_6_0.HelperBar)

	local var_6_2 = var_6_0
	local var_6_3

	if CONDITIONS.InGame(var_6_0) then
		local var_6_4 = MenuBuilder.BuildRegisteredType("InGameMenuBackground", {
			controllerIndex = var_6_1
		})

		var_6_4.id = "InGameMenuBackground"

		var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_6_0:addElement(var_6_4)

		var_6_0.InGameMenuBackground = var_6_4
	end

	local var_6_5
	local var_6_6 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 4,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("StickerLocationButton", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		spacingX = _1080p * 20,
		spacingY = _1080p * 20,
		columnWidth = _1080p * 301,
		rowHeight = _1080p * 112,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_7 = LUI.UIGrid.new(var_6_6)

	var_6_7.id = "StickerLocationButtonGrid"

	var_6_7:setUseStencil(true)
	var_6_7:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -632, _1080p * 632, _1080p * -235, _1080p * -101)
	var_6_0:addElement(var_6_7)

	var_6_0.StickerLocationButtonGrid = var_6_7

	local var_6_8
	local var_6_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_6_1
	})

	var_6_9.id = "TabBacker"

	var_6_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_6_0:addElement(var_6_9)

	var_6_0.TabBacker = var_6_9

	local var_6_10
	local var_6_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_11.id = "MenuTitle"

	var_6_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STICKER_SELECT_TITLE")), 0)
	var_6_11.Line:SetLeft(0, 0)
	var_6_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_11)

	var_6_0.MenuTitle = var_6_11

	local var_6_12
	local var_6_13 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_6_1
	})

	var_6_13.id = "LobbyMembersFooter"

	var_6_13:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_6_0:addElement(var_6_13)

	var_6_0.LobbyMembersFooter = var_6_13

	local var_6_14
	local var_6_15 = MenuBuilder.BuildRegisteredType("GunsmithWeaponLevel", {
		controllerIndex = var_6_1
	})

	var_6_15.id = "GunsmithWeaponLevel"

	var_6_15:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -643, _1080p * -447, _1080p * 61, _1080p * 85)
	var_6_0:addElement(var_6_15)

	var_6_0.GunsmithWeaponLevel = var_6_15

	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("CAS/PREVIEW_WEAPON")
	})

	local var_6_16 = LUI.UIBindButton.new()

	var_6_16.id = "selfBindButton"

	var_6_0:addElement(var_6_16)

	var_6_0.bindButton = var_6_16

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("StickerLocationSelect", StickerLocationSelect)
LockTable(_M)
