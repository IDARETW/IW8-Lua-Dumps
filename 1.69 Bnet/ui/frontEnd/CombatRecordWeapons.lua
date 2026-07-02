module(..., package.seeall)

local var_0_0 = {
	WEAPON.ARClass,
	WEAPON.SMGClass,
	WEAPON.SHOTGUNClass,
	WEAPON.LMGClass,
	WEAPON.tacticalClass,
	WEAPON.DMRClass,
	WEAPON.sniperClass,
	WEAPON.MELEEClass,
	WEAPON.pistolClass,
	WEAPON.LAUNCHERClass,
	WEAPON.MELEEClass2
}
local var_0_1 = {
	NonWeaponGrid = 0,
	WeaponGrid = 1
}

local function var_0_2(arg_1_0, arg_1_1)
	local var_1_0 = {}
	local var_1_1 = 0

	for iter_1_0 = 1, #var_0_0 do
		local var_1_2 = WEAPON.GetStatsTableForClass(arg_1_1, var_0_0[iter_1_0], CONDITIONS.IsCoreMultiplayer() or CONDITIONS.IsThirdGameMode())

		var_1_1 = var_1_1 + #var_1_2

		table.sort(var_1_2, function(arg_2_0, arg_2_1)
			if arg_2_0.displayOrder and arg_2_1.displayOrder then
				return arg_2_0.displayOrder < arg_2_1.displayOrder
			end

			return false
		end)
		table.insert(var_1_0, var_1_2)
	end

	arg_1_0._totalWeaponCount = var_1_1

	return var_1_0
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Name)
	assert(arg_3_0.Image)
	assert(arg_3_0.Stats)

	local var_3_0

	if arg_3_0._tabIndex == 1 then
		if arg_3_2 then
			var_3_0 = RECORDS.FormatWeaponData(arg_3_2)
		end
	elseif arg_3_0._tabIndex == 2 then
		var_3_0 = RECORDS.FormatLethalData(arg_3_0._recordData[arg_3_1])
	elseif arg_3_0._tabIndex == 3 then
		var_3_0 = RECORDS.FormatTacticalData(arg_3_0._recordData[arg_3_1])
	elseif arg_3_0._tabIndex == 4 then
		var_3_0 = RECORDS.FormatStreakData(arg_3_0._recordData[arg_3_1])
	elseif arg_3_0._tabIndex == 5 then
		var_3_0 = RECORDS.FormatGameModeData(arg_3_0._recordData[arg_3_1])
	elseif arg_3_0._tabIndex == 6 then
		var_3_0 = RECORDS.FormatSuperData(arg_3_0._recordData[arg_3_1])
	end

	arg_3_0.Name:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_LOCALIZED", var_3_0.item))
	arg_3_0.Stats:Setup(var_3_0.stats)

	local var_3_1 = RegisterMaterial(var_3_0.image)

	if Engine.DFEIGFBEH(var_3_1) > 1 then
		ACTIONS.AnimateSequence(arg_3_0, "Icon2x1")
	else
		ACTIONS.AnimateSequence(arg_3_0, "Icon1x1")
	end

	arg_3_0.Image:setImage(var_3_1)
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0._recordData
	local var_4_1 = 0

	for iter_4_0 = 1, #var_4_0 do
		var_4_1 = var_4_1 + #var_4_0[iter_4_0]

		if var_4_1 < arg_4_1 then
			arg_4_1 = arg_4_1 - 1
		end
	end

	return arg_4_1, arg_4_0._totalWeaponCount
end

local function var_0_5(arg_5_0, arg_5_1)
	local var_5_0

	local function var_5_1()
		local var_6_0 = #var_0_0

		for iter_6_0 = 1, #var_0_0 do
			var_6_0 = var_6_0 + #arg_5_0._recordData[iter_6_0]
		end

		return var_6_0
	end

	local function var_5_2()
		local var_7_0 = arg_5_0.WeaponsGrid:GetFocusPosition()
		local var_7_1, var_7_2 = var_0_4(arg_5_0, var_7_0)

		return var_7_1, var_7_2
	end

	local var_5_3 = {
		buildArrowsLabel = true,
		maxVisibleRows = 12,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = false,
		maxVisibleColumns = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		maxRows = var_5_1(),
		controllerIndex = arg_5_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		countFunction = var_5_2
	}
	local var_5_4 = LUI.UIGrid.new(var_5_3)

	var_5_4.id = "WeaponsGrid"

	var_5_4:setUseStencil(true)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 216, _1080p * 790)
	arg_5_0:addElement(var_5_4)

	arg_5_0.WeaponsGrid = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_5_1
	})

	var_5_6.id = "VerticalMinimalScrollbar"

	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 555, _1080p * 566, _1080p * 216, _1080p * 782)
	arg_5_0:addElement(var_5_6)

	arg_5_0.VerticalMinimalScrollbar = var_5_6

	local var_5_7 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_5_0.VerticalMinimalScrollbar,
		startCap = arg_5_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_5_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_5_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_5_0.VerticalMinimalScrollbar.sliderArea and arg_5_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_5_0.VerticalMinimalScrollbar.sliderArea and arg_5_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	arg_5_0.WeaponsGrid:AddScrollbar(var_5_7)
end

local function var_0_6(arg_8_0, arg_8_1)
	local var_8_0
	local var_8_1 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 12,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = arg_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
				controllerIndex = arg_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_2 = LUI.UIGrid.new(var_8_1)

	var_8_2.id = "Grid"

	var_8_2:setUseStencil(true)
	var_8_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 216, _1080p * 790)
	arg_8_0:addElement(var_8_2)

	arg_8_0.Grid = var_8_2

	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_8_1
	})

	var_8_4.id = "VerticalMinimalScrollbar"

	var_8_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 555, _1080p * 566, _1080p * 216, _1080p * 782)
	arg_8_0:addElement(var_8_4)

	arg_8_0.VerticalMinimalScrollbar = var_8_4

	local var_8_5 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_8_0.VerticalMinimalScrollbar,
		startCap = arg_8_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_8_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_8_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_8_0.VerticalMinimalScrollbar.sliderArea and arg_8_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_8_0.VerticalMinimalScrollbar.sliderArea and arg_8_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	arg_8_0.Grid:AddScrollbar(var_8_5)
end

local function var_0_7(arg_11_0, arg_11_1)
	if arg_11_1 == var_0_1.NonWeaponGrid then
		arg_11_0.Grid.GridCountArrows:closeTree()

		arg_11_0.Grid.GridCountArrows = nil

		arg_11_0.Grid:closeTree()

		arg_11_0.Grid = nil
	elseif arg_11_1 == var_0_1.WeaponGrid then
		arg_11_0.WeaponsGrid.GridCountArrows:closeTree()

		arg_11_0.WeaponsGrid.GridCountArrows = nil

		arg_11_0.WeaponsGrid:closeTree()

		arg_11_0.WeaponsGrid = nil
	end

	arg_11_0.VerticalMinimalScrollbar:closeTree()

	arg_11_0.VerticalMinimalScrollbar = nil
end

local function var_0_8(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_12_1
	})

	var_12_0.id = "weaponRow" .. arg_12_2.name

	var_12_0.Text:setText(Engine.CBBHFCGDIC(arg_12_2.name))
	var_12_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", arg_12_2.kills))

	var_12_0.recordData = arg_12_2
	var_12_0.menu = arg_12_0

	var_12_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
		if arg_13_0.menu and arg_13_0.menu.UpdateMenu then
			arg_13_0.menu:UpdateMenu(nil, arg_13_0.recordData)
		end
	end)

	return var_12_0
end

local function var_0_9(arg_14_0, arg_14_1)
	local var_14_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_14_0
	})

	var_14_0.id = "challengeHeader" .. arg_14_1

	var_14_0.Title:setText(arg_14_1)
	var_14_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)

	return var_14_0
end

local function var_0_10(arg_15_0)
	local var_15_0 = arg_15_0._recordData
	local var_15_1 = arg_15_0._controllerIndex

	for iter_15_0 = 1, #var_0_0 do
		local var_15_2 = var_0_0[iter_15_0]
		local var_15_3 = StringTable.DIFCHIGDFB(CSV.MPWeaponClasses.file, CSV.MPWeaponClasses.cols.ref, var_15_2, CSV.MPWeaponClasses.cols.name)

		arg_15_0.WeaponsGrid:AddElement(var_0_9(var_15_1, Engine.CBBHFCGDIC(var_15_3)))

		for iter_15_1 = 1, #var_15_0[iter_15_0] do
			arg_15_0.WeaponsGrid:AddElement(var_0_8(arg_15_0, var_15_1, var_15_0[iter_15_0][iter_15_1]))
		end
	end
end

local function var_0_11(arg_16_0)
	if arg_16_0._tabIndex ~= 1 then
		if arg_16_0.WeaponsGrid then
			var_0_7(arg_16_0, var_0_1.WeaponGrid)
		end

		if not arg_16_0.Grid then
			var_0_6(arg_16_0, arg_16_0._controllerIndex)
		end

		assert(arg_16_0.Grid)
		arg_16_0.Grid:SetNumChildren(#arg_16_0._recordData)
		arg_16_0.Grid:SetRefreshChild(function(arg_17_0, arg_17_1, arg_17_2)
			local var_17_0 = arg_17_1 + arg_17_2 * arg_16_0.Grid:GetNumColumns() + 1

			if arg_16_0._tabIndex == 2 then
				arg_17_0.Text:setText(Engine.CBBHFCGDIC(arg_16_0._recordData[var_17_0].nameRef))
				arg_17_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_16_0._recordData[var_17_0].uses))
			elseif arg_16_0._tabIndex == 3 then
				arg_17_0.Text:setText(Engine.CBBHFCGDIC(arg_16_0._recordData[var_17_0].nameRef))
				arg_17_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_16_0._recordData[var_17_0].uses))
			elseif arg_16_0._tabIndex == 4 then
				arg_17_0.Text:setText(Engine.CBBHFCGDIC(arg_16_0._recordData[var_17_0].name))
				arg_17_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_16_0._recordData[var_17_0].uses))
			elseif arg_16_0._tabIndex == 5 then
				if arg_16_0._recordData[var_17_0].isHardcore then
					arg_17_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", arg_16_0._recordData[var_17_0].name))
				else
					arg_17_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_LOCALIZED", arg_16_0._recordData[var_17_0].name))
				end

				arg_17_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", arg_16_0._recordData[var_17_0].kills))
			elseif arg_16_0._tabIndex == 6 then
				arg_17_0.Text:setText(Engine.CBBHFCGDIC(arg_16_0._recordData[var_17_0].name))
				arg_17_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_16_0._recordData[var_17_0].uses))
			end

			arg_17_0.index = var_17_0

			if not arg_17_0._handlersAdded then
				arg_17_0._handlersAdded = true

				arg_17_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
					var_0_3(arg_16_0, arg_18_0.index)
				end)
			end
		end)
		arg_16_0.Grid:FocusFirstItem()
	else
		if arg_16_0.Grid then
			var_0_7(arg_16_0, var_0_1.NonWeaponGrid)
		end

		if arg_16_0.WeaponsGrid then
			var_0_7(arg_16_0, var_0_1.WeaponGrid)
		end

		var_0_5(arg_16_0, arg_16_0._controllerIndex)
		var_0_10(arg_16_0)
		arg_16_0.WeaponsGrid:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)

		arg_16_0:Wait(1).onComplete = function()
			arg_16_0.WeaponsGrid:UpdateNumbersArrowsAndScrolling()
		end
	end
end

local function var_0_12(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0._tabIndex = arg_20_1

	if arg_20_0._tabIndex == 1 then
		arg_20_0._recordData = var_0_2(arg_20_0, arg_20_0._controllerIndex)
	elseif arg_20_0._tabIndex == 2 then
		arg_20_0._recordData = EQUIPMENT.GetLethalStats(arg_20_0._controllerIndex)
	elseif arg_20_0._tabIndex == 3 then
		arg_20_0._recordData = EQUIPMENT.GetTacticalStats(arg_20_0._controllerIndex)
	elseif arg_20_0._tabIndex == 4 then
		arg_20_0._recordData = STREAK.GetStatsTable(arg_20_0._controllerIndex)
	elseif arg_20_0._tabIndex == 5 then
		arg_20_0._recordData = MP.GetGameModeStats(arg_20_0._controllerIndex, arg_20_2)
	elseif arg_20_0._tabIndex == 6 then
		arg_20_0._recordData = SUPER.GetStatsTable(arg_20_0._controllerIndex)
	end

	var_0_11(arg_20_0)

	if arg_20_0._tabIndex == 1 then
		local var_20_0 = arg_20_0._recordData[1][1]

		var_0_3(arg_20_0, nil, var_20_0)
	else
		var_0_3(arg_20_0, 1)
	end
end

local function var_0_13(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.InitializeData = InitializeData
	arg_21_0.UpdateTab = var_0_12
	arg_21_0.UpdateMenu = var_0_3
	arg_21_0._controllerIndex = arg_21_1
	arg_21_0._tabIndex = 1
	arg_21_0._recordData = WEAPON.GetStatsTable(arg_21_1)
end

function CombatRecordWeapons(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIElement.new()

	var_22_0.id = "CombatRecordWeapons"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	var_22_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_22_1
	})
	var_22_0.HelperBar.id = "HelperBar"

	var_22_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_22_0.HelperBar:setPriority(10)
	var_22_0:addElement(var_22_0.HelperBar)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_22_1
	})

	var_22_4.id = "DoubleNotchedBacker"

	var_22_4:SetAlpha(0.5, 0)
	var_22_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 648, _1080p * 1207, _1080p * 216, _1080p * 555)
	var_22_0:addElement(var_22_4)

	var_22_0.DoubleNotchedBacker = var_22_4

	local var_22_5
	local var_22_6 = MenuBuilder.BuildRegisteredType("CombatRecordStatsGroup", {
		controllerIndex = var_22_1
	})

	var_22_6.id = "Stats"

	var_22_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1244, _1080p * 1824, _1080p * 216, _1080p * 736)
	var_22_0:addElement(var_22_6)

	var_22_0.Stats = var_22_6

	local var_22_7
	local var_22_8 = LUI.UIStyledText.new()

	var_22_8.id = "Name"

	var_22_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_22_8:setText("", 0)
	var_22_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_22_8:SetWordWrap(false)
	var_22_8:SetAlignment(LUI.Alignment.Left)
	var_22_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_22_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_22_8:SetStartupDelay(1000)
	var_22_8:SetLineHoldTime(400)
	var_22_8:SetAnimMoveTime(150)
	var_22_8:SetAnimMoveSpeed(50)
	var_22_8:SetEndDelay(1000)
	var_22_8:SetCrossfadeTime(400)
	var_22_8:SetFadeInTime(300)
	var_22_8:SetFadeOutTime(300)
	var_22_8:SetMaxVisibleLines(1)
	var_22_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 1118, _1080p * 228, _1080p * 264)
	var_22_0:addElement(var_22_8)

	var_22_0.Name = var_22_8

	local var_22_9
	local var_22_10 = LUI.UIImage.new()

	var_22_10.id = "Image"

	var_22_10:setImage(RegisterMaterial("icon_cac_weapon_ar_akilo47"), 0)
	var_22_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 700, _1080p * 1156, _1080p * 290, _1080p * 518)
	var_22_0:addElement(var_22_10)

	var_22_0.Image = var_22_10

	local var_22_11
	local var_22_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_22_1
	})

	var_22_12.id = "LobbyMembersFooter"

	var_22_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_22_0:addElement(var_22_12)

	var_22_0.LobbyMembersFooter = var_22_12

	local function var_22_13()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_13

	local var_22_14
	local var_22_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1156
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 700
		}
	}

	var_22_10:RegisterAnimationSequence("Icon2x1", var_22_15)

	local function var_22_16()
		var_22_10:AnimateSequence("Icon2x1")
	end

	var_22_0._sequences.Icon2x1 = var_22_16

	local var_22_17
	local var_22_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 814
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1042
		}
	}

	var_22_10:RegisterAnimationSequence("Icon1x1", var_22_18)

	local function var_22_19()
		var_22_10:AnimateSequence("Icon1x1")
	end

	var_22_0._sequences.Icon1x1 = var_22_19

	var_0_13(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("CombatRecordWeapons", CombatRecordWeapons)
LockTable(_M)
