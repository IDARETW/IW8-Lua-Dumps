module(..., package.seeall)

local var_0_0 = {
	WEAPON.ARClass,
	WEAPON.SMGClass,
	WEAPON.SHOTGUNClass,
	WEAPON.LMGClass,
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
		local var_1_2 = WEAPON.GetStatsTableForClass(arg_1_1, var_0_0[iter_1_0])

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
		local var_6_0 = arg_5_0.WeaponsGrid:GetFocusPosition()
		local var_6_1, var_6_2 = var_0_4(arg_5_0, var_6_0)

		return var_6_1, var_6_2
	end

	local var_5_2 = {
		buildArrowsLabel = true,
		maxRows = 100,
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
		controllerIndex = arg_5_1,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		countFunction = var_5_1
	}
	local var_5_3 = LUI.UIGrid.new(var_5_2)

	var_5_3.id = "WeaponsGrid"

	var_5_3:setUseStencil(true)
	var_5_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 216, _1080p * 790)
	arg_5_0:addElement(var_5_3)

	arg_5_0.WeaponsGrid = var_5_3

	local var_5_4
	local var_5_5 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_5_1
	})

	var_5_5.id = "VerticalMinimalScrollbar"

	var_5_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 555, _1080p * 566, _1080p * 216, _1080p * 782)
	arg_5_0:addElement(var_5_5)

	arg_5_0.VerticalMinimalScrollbar = var_5_5

	local var_5_6 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_5_0.VerticalMinimalScrollbar,
		startCap = arg_5_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_5_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_5_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_5_0.VerticalMinimalScrollbar.sliderArea and arg_5_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_5_0.VerticalMinimalScrollbar.sliderArea and arg_5_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	arg_5_0.WeaponsGrid:AddScrollbar(var_5_6)
end

local function var_0_6(arg_7_0, arg_7_1)
	local var_7_0
	local var_7_1 = {
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
		controllerIndex = arg_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
				controllerIndex = arg_7_1
			})
		end,
		refreshChild = function(arg_9_0, arg_9_1, arg_9_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_2 = LUI.UIGrid.new(var_7_1)

	var_7_2.id = "Grid"

	var_7_2:setUseStencil(true)
	var_7_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 216, _1080p * 790)
	arg_7_0:addElement(var_7_2)

	arg_7_0.Grid = var_7_2

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_7_1
	})

	var_7_4.id = "VerticalMinimalScrollbar"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 555, _1080p * 566, _1080p * 216, _1080p * 782)
	arg_7_0:addElement(var_7_4)

	arg_7_0.VerticalMinimalScrollbar = var_7_4

	local var_7_5 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_7_0.VerticalMinimalScrollbar,
		startCap = arg_7_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_7_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_7_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_7_0.VerticalMinimalScrollbar.sliderArea and arg_7_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_7_0.VerticalMinimalScrollbar.sliderArea and arg_7_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	arg_7_0.Grid:AddScrollbar(var_7_5)
end

local function var_0_7(arg_10_0, arg_10_1)
	if arg_10_1 == var_0_1.NonWeaponGrid then
		arg_10_0.Grid.GridCountArrows:closeTree()

		arg_10_0.Grid.GridCountArrows = nil

		arg_10_0.Grid:closeTree()

		arg_10_0.Grid = nil
	elseif arg_10_1 == var_0_1.WeaponGrid then
		arg_10_0.WeaponsGrid.GridCountArrows:closeTree()

		arg_10_0.WeaponsGrid.GridCountArrows = nil

		arg_10_0.WeaponsGrid:closeTree()

		arg_10_0.WeaponsGrid = nil
	end

	arg_10_0.VerticalMinimalScrollbar:closeTree()

	arg_10_0.VerticalMinimalScrollbar = nil
end

local function var_0_8(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = MenuBuilder.BuildRegisteredType("GenericDualLabelButton", {
		controllerIndex = arg_11_1
	})

	var_11_0.id = "weaponRow" .. arg_11_2.name

	var_11_0.Text:setText(Engine.CBBHFCGDIC(arg_11_2.name))
	var_11_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", arg_11_2.kills))

	var_11_0.recordData = arg_11_2
	var_11_0.menu = arg_11_0

	var_11_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if arg_12_0.menu and arg_12_0.menu.UpdateMenu then
			arg_12_0.menu:UpdateMenu(nil, arg_12_0.recordData)
		end
	end)

	return var_11_0
end

local function var_0_9(arg_13_0, arg_13_1)
	local var_13_0 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = arg_13_0
	})

	var_13_0.id = "challengeHeader" .. arg_13_1

	var_13_0.Title:setText(arg_13_1)
	var_13_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 40)

	return var_13_0
end

local function var_0_10(arg_14_0)
	local var_14_0 = arg_14_0._recordData
	local var_14_1 = arg_14_0._controllerIndex

	for iter_14_0 = 1, #var_0_0 do
		local var_14_2 = var_0_0[iter_14_0]
		local var_14_3 = StringTable.DIFCHIGDFB(CSV.MPWeaponClasses.file, CSV.MPWeaponClasses.cols.ref, var_14_2, CSV.MPWeaponClasses.cols.name)

		arg_14_0.WeaponsGrid:AddElement(var_0_9(var_14_1, Engine.CBBHFCGDIC(var_14_3)))

		for iter_14_1 = 1, #var_14_0[iter_14_0] do
			arg_14_0.WeaponsGrid:AddElement(var_0_8(arg_14_0, var_14_1, var_14_0[iter_14_0][iter_14_1]))
		end
	end
end

local function var_0_11(arg_15_0)
	if arg_15_0._tabIndex ~= 1 then
		if arg_15_0.WeaponsGrid then
			var_0_7(arg_15_0, var_0_1.WeaponGrid)
		end

		if not arg_15_0.Grid then
			var_0_6(arg_15_0, arg_15_0._controllerIndex)
		end

		assert(arg_15_0.Grid)
		arg_15_0.Grid:SetNumChildren(#arg_15_0._recordData)
		arg_15_0.Grid:SetRefreshChild(function(arg_16_0, arg_16_1, arg_16_2)
			local var_16_0 = arg_16_1 + arg_16_2 * arg_15_0.Grid:GetNumColumns() + 1

			if arg_15_0._tabIndex == 2 then
				arg_16_0.Text:setText(Engine.CBBHFCGDIC(arg_15_0._recordData[var_16_0].nameRef))
				arg_16_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_15_0._recordData[var_16_0].uses))
			elseif arg_15_0._tabIndex == 3 then
				arg_16_0.Text:setText(Engine.CBBHFCGDIC(arg_15_0._recordData[var_16_0].nameRef))
				arg_16_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_15_0._recordData[var_16_0].uses))
			elseif arg_15_0._tabIndex == 4 then
				arg_16_0.Text:setText(Engine.CBBHFCGDIC(arg_15_0._recordData[var_16_0].name))
				arg_16_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_15_0._recordData[var_16_0].uses))
			elseif arg_15_0._tabIndex == 5 then
				if arg_15_0._recordData[var_16_0].isHardcore then
					arg_16_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/HARDCORE_GAME_TYPE", arg_15_0._recordData[var_16_0].name))
				else
					arg_16_0.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_LOCALIZED", arg_15_0._recordData[var_16_0].name))
				end

				arg_16_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU/N_KILLS", arg_15_0._recordData[var_16_0].kills))
			elseif arg_15_0._tabIndex == 6 then
				arg_16_0.Text:setText(Engine.CBBHFCGDIC(arg_15_0._recordData[var_16_0].name))
				arg_16_0.DynamicText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/N_USES", arg_15_0._recordData[var_16_0].uses))
			end

			arg_16_0.index = var_16_0

			if not arg_16_0._handlersAdded then
				arg_16_0._handlersAdded = true

				arg_16_0:addEventHandler("button_over", function(arg_17_0, arg_17_1)
					var_0_3(arg_15_0, arg_17_0.index)
				end)
			end
		end)
		arg_15_0.Grid:FocusFirstItem()
	else
		if arg_15_0.Grid then
			var_0_7(arg_15_0, var_0_1.NonWeaponGrid)
		end

		if arg_15_0.WeaponsGrid then
			var_0_7(arg_15_0, var_0_1.WeaponGrid)
		end

		var_0_5(arg_15_0, arg_15_0._controllerIndex)
		var_0_10(arg_15_0)
		arg_15_0.WeaponsGrid:SetFocusedPosition({
			x = 0,
			y = 1
		}, true)

		arg_15_0:Wait(1).onComplete = function()
			arg_15_0.WeaponsGrid:UpdateNumbersArrowsAndScrolling()
		end
	end
end

local function var_0_12(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0._tabIndex = arg_19_1

	if arg_19_0._tabIndex == 1 then
		arg_19_0._recordData = var_0_2(arg_19_0, arg_19_0._controllerIndex)
	elseif arg_19_0._tabIndex == 2 then
		arg_19_0._recordData = EQUIPMENT.GetLethalStats(arg_19_0._controllerIndex)
	elseif arg_19_0._tabIndex == 3 then
		arg_19_0._recordData = EQUIPMENT.GetTacticalStats(arg_19_0._controllerIndex)
	elseif arg_19_0._tabIndex == 4 then
		arg_19_0._recordData = STREAK.GetStatsTable(arg_19_0._controllerIndex)
	elseif arg_19_0._tabIndex == 5 then
		arg_19_0._recordData = MP.GetGameModeStats(arg_19_0._controllerIndex, arg_19_2)
	elseif arg_19_0._tabIndex == 6 then
		arg_19_0._recordData = SUPER.GetStatsTable(arg_19_0._controllerIndex)
	end

	var_0_11(arg_19_0)

	if arg_19_0._tabIndex == 1 then
		local var_19_0 = arg_19_0._recordData[1][1]

		var_0_3(arg_19_0, nil, var_19_0)
	else
		var_0_3(arg_19_0, 1)
	end
end

local function var_0_13(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.InitializeData = InitializeData
	arg_20_0.UpdateTab = var_0_12
	arg_20_0.UpdateMenu = var_0_3
	arg_20_0._controllerIndex = arg_20_1
	arg_20_0._tabIndex = 1
	arg_20_0._recordData = WEAPON.GetStatsTable(arg_20_1)
end

function CombatRecordWeapons(arg_21_0, arg_21_1)
	local var_21_0 = LUI.UIElement.new()

	var_21_0.id = "CombatRecordWeapons"
	var_21_0._animationSets = var_21_0._animationSets or {}
	var_21_0._sequences = var_21_0._sequences or {}

	local var_21_1 = arg_21_1 and arg_21_1.controllerIndex

	if not var_21_1 and not Engine.DDJFBBJAIG() then
		var_21_1 = var_21_0:getRootController()
	end

	assert(var_21_1)

	var_21_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_21_1
	})
	var_21_0.HelperBar.id = "HelperBar"

	var_21_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_21_0.HelperBar:setPriority(10)
	var_21_0:addElement(var_21_0.HelperBar)

	local var_21_2 = var_21_0
	local var_21_3
	local var_21_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_21_1
	})

	var_21_4.id = "DoubleNotchedBacker"

	var_21_4:SetAlpha(0.5, 0)
	var_21_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 648, _1080p * 1207, _1080p * 216, _1080p * 555)
	var_21_0:addElement(var_21_4)

	var_21_0.DoubleNotchedBacker = var_21_4

	local var_21_5
	local var_21_6 = MenuBuilder.BuildRegisteredType("CombatRecordStatsGroup", {
		controllerIndex = var_21_1
	})

	var_21_6.id = "Stats"

	var_21_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1244, _1080p * 1824, _1080p * 216, _1080p * 736)
	var_21_0:addElement(var_21_6)

	var_21_0.Stats = var_21_6

	local var_21_7
	local var_21_8 = LUI.UIStyledText.new()

	var_21_8.id = "Name"

	var_21_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_21_8:setText("", 0)
	var_21_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_21_8:SetWordWrap(false)
	var_21_8:SetAlignment(LUI.Alignment.Left)
	var_21_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_21_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_21_8:SetStartupDelay(1000)
	var_21_8:SetLineHoldTime(400)
	var_21_8:SetAnimMoveTime(150)
	var_21_8:SetAnimMoveSpeed(50)
	var_21_8:SetEndDelay(1000)
	var_21_8:SetCrossfadeTime(400)
	var_21_8:SetFadeInTime(300)
	var_21_8:SetFadeOutTime(300)
	var_21_8:SetMaxVisibleLines(1)
	var_21_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 676, _1080p * 1118, _1080p * 228, _1080p * 264)
	var_21_0:addElement(var_21_8)

	var_21_0.Name = var_21_8

	local var_21_9
	local var_21_10 = LUI.UIImage.new()

	var_21_10.id = "Image"

	var_21_10:setImage(RegisterMaterial("icon_cac_weapon_ar_akilo47"), 0)
	var_21_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 700, _1080p * 1156, _1080p * 290, _1080p * 518)
	var_21_0:addElement(var_21_10)

	var_21_0.Image = var_21_10

	local var_21_11
	local var_21_12 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_21_1
	})

	var_21_12.id = "LobbyMembersFooter"

	var_21_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_21_0:addElement(var_21_12)

	var_21_0.LobbyMembersFooter = var_21_12

	local function var_21_13()
		return
	end

	var_21_0._sequences.DefaultSequence = var_21_13

	local var_21_14
	local var_21_15 = {
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

	var_21_10:RegisterAnimationSequence("Icon2x1", var_21_15)

	local function var_21_16()
		var_21_10:AnimateSequence("Icon2x1")
	end

	var_21_0._sequences.Icon2x1 = var_21_16

	local var_21_17
	local var_21_18 = {
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

	var_21_10:RegisterAnimationSequence("Icon1x1", var_21_18)

	local function var_21_19()
		var_21_10:AnimateSequence("Icon1x1")
	end

	var_21_0._sequences.Icon1x1 = var_21_19

	var_0_13(var_21_0, var_21_1, arg_21_1)

	return var_21_0
end

MenuBuilder.registerType("CombatRecordWeapons", CombatRecordWeapons)
LockTable(_M)
