module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.FlowManager.GetScopedData("WeaponLocker")
	local var_1_1 = var_1_0.filteredWeapons

	if var_1_1[arg_1_0._weapon] then
		var_1_1[arg_1_0._weapon] = nil
	else
		var_1_1[arg_1_0._weapon] = true
	end

	arg_1_0.Checkbox:SetValue(var_1_1[arg_1_0._weapon])

	var_1_0.updateModifications = true
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.WeaponGrid)

	local var_2_0 = WEAPON.GetWeaponsWithModifications(arg_2_1)

	arg_2_0.WeaponGrid:SetRefreshChild(function(arg_3_0, arg_3_1, arg_3_2)
		assert(arg_3_0.Checkbox)
		assert(arg_3_0.Text)

		local var_3_0 = arg_2_0.WeaponGrid:GetContentIndex(arg_3_1, arg_3_2)

		arg_3_0._weapon = var_2_0[var_3_0 + 1]

		if not arg_3_0._handlersAdded then
			arg_3_0:addEventHandler("button_action", var_0_0)

			arg_3_0._handlersAdded = true
		end

		local var_3_1 = LUI.FlowManager.GetScopedData("WeaponLocker").filteredWeapons

		arg_3_0.Checkbox:SetValue(var_3_1[arg_3_0._weapon])
		arg_3_0.Text:setText(WEAPON.GetName(arg_3_0._weapon))
	end)
	arg_2_0.WeaponGrid:SetNumChildren(#var_2_0)
	arg_2_0.WeaponGrid:RefreshContent()
	arg_2_0:addEventHandler("menu_create", function(arg_4_0, arg_4_1)
		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("CAS/CLEAR_FILTER")
		})
	end)

	local var_2_1 = LUI.UIBindButton.new()

	arg_2_0:addElement(var_2_1)
	var_2_1:addEventHandler("button_alt1", function(arg_5_0, arg_5_1)
		LUI.FlowManager.GetScopedData("WeaponLocker").filteredWeapons = {}

		arg_2_0.WeaponGrid:RefreshContent()
	end)
end

function WeaponLockerFilterLayout(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "WeaponLockerFilterLayout"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIText.new()

	var_6_4.id = "Weapon"

	var_6_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_4:setText("Weapon", 0)
	var_6_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_4:SetAlignment(LUI.Alignment.Left)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 22)
	var_6_0:addElement(var_6_4)

	var_6_0.Weapon = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "Line"

	var_6_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_6:SetAlpha(0.4, 0)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 392, _1080p * 22, _1080p * 23)
	var_6_0:addElement(var_6_6)

	var_6_0.Line = var_6_6

	local var_6_7
	local var_6_8 = {
		scrollingThresholdX = 0,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 0,
		wrapX = true,
		maxVisibleColumns = 2,
		maxVisibleRows = 30,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_6_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GenericCheckBoxButtonWithLabel", {
				controllerIndex = var_6_1
			})
		end,
		refreshChild = function(arg_8_0, arg_8_1, arg_8_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 200,
		rowHeight = _1080p * 25,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_6_9 = LUI.UIGrid.new(var_6_8)

	var_6_9.id = "WeaponGrid"

	var_6_9:setUseStencil(true)
	var_6_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 34, _1080p * 1084)
	var_6_0:addElement(var_6_9)

	var_6_0.WeaponGrid = var_6_9

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WeaponLockerFilterLayout", WeaponLockerFilterLayout)
LockTable(_M)
