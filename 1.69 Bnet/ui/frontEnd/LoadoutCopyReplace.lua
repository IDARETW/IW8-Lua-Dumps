module(..., package.seeall)

local function var_0_0(arg_1_0)
	return function(arg_2_0, arg_2_1)
		local var_2_0 = arg_1_0._playerData[arg_1_0._copiedLoadoutIndex]

		LOADOUT.CopyAndReplaceLoadout(arg_1_0, var_2_0, arg_2_0._loadout)
		arg_1_0:dispatchEventToRoot({
			name = "refresh_loadouts"
		})
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.Loadouts)
	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/COPY_LOADOUT"))

	if Engine.BHICADFIHA() and not arg_3_2.loadoutIndex then
		DebugPrint("WARNING: Missing \"loadoutIndex\" option for LoadoutOptionsPopup menu. Only OK after a MyChanges.")

		arg_3_2.loadoutIndex = 0
	end

	assert(arg_3_2.loadoutIndex)

	arg_3_0._playerData = PlayerData.BFFBGAJGD(arg_3_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers.loadouts
	arg_3_0._copiedLoadoutIndex = arg_3_2.loadoutIndex

	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ddlpairs(arg_3_0._playerData) do
		table.insert(var_3_0, {
			loadoutIndex = iter_3_0,
			data = iter_3_1
		})
	end

	arg_3_0.Loadouts:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = var_3_0[arg_4_2 + 1]

		arg_4_0.Text:setText(var_4_0.data.name:get())

		arg_4_0._loadout = var_4_0.data

		arg_4_0:registerEventHandler("button_action", var_0_0(arg_3_0))

		if var_4_0.loadoutIndex == arg_3_0._copiedLoadoutIndex then
			arg_4_0:SetButtonDisabled(true)
		end
	end)
	arg_3_0.Loadouts:SetNumRows(#var_3_0)
	arg_3_0.Loadouts:SetNumColumns(1)
	arg_3_0.Loadouts:RefreshContent()

	local var_3_1 = arg_3_0._playerData[arg_3_0._copiedLoadoutIndex]

	arg_3_0.Replace:setText(Engine.CBBHFCGDIC("CAS/REPLACE_LOADOUT", Engine.JCBDICCAH(var_3_1.name:get())))

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function LoadoutCopyReplace(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "LoadoutCopyReplace"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "MenuTitle"

	var_5_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COPY_LOADOUT")), 0)
	var_5_4.Line:SetLeft(0, 0)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_4)

	var_5_0.MenuTitle = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIText.new()

	var_5_6.id = "Replace"

	var_5_6:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt2, 0)
	var_5_6:setText("", 0)
	var_5_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_6:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 86, _1080p * 514, _1080p * 126, _1080p * 144)
	var_5_0:addElement(var_5_6)

	var_5_0.Replace = var_5_6

	local var_5_7
	local var_5_8 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_5_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericButton", {
				controllerIndex = var_5_1
			})
		end,
		refreshChild = function(arg_7_0, arg_7_1, arg_7_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 420,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_5_9 = LUI.UIGrid.new(var_5_8)

	var_5_9.id = "Loadouts"

	var_5_9:setUseStencil(false)
	var_5_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 86, _1080p * 506, _1080p * 195, _1080p * 375)
	var_5_0:addElement(var_5_9)

	var_5_0.Loadouts = var_5_9

	local function var_5_10()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_10

	local var_5_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 156
		}
	}

	var_5_6:RegisterAnimationSequence("AR", var_5_11)

	local function var_5_12()
		var_5_6:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_12

	function var_5_0.addButtonHelperFunction(arg_10_0, arg_10_1)
		arg_10_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_13 = LUI.UIBindButton.new()

	var_5_13.id = "selfBindButton"

	var_5_0:addElement(var_5_13)

	var_5_0.bindButton = var_5_13

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("LoadoutCopyReplace", LoadoutCopyReplace)
LockTable(_M)
