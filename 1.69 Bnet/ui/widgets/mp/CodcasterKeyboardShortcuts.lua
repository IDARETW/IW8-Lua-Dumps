module(..., package.seeall)

local var_0_0 = "inGame.mp.CodcasterKeyboardShortcuts"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = StringTable.BFHCAIIDA(CSV.codcasterKeyboardShortcuts.file)
	local var_1_2 = LUI.DataSourceFromList.new(var_1_1)

	var_1_2:SetCachingEnabled(true)

	function var_1_2.MakeDataSourceAtIndex(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = StringTable.CBGJCDIHCE(CSV.codcasterKeyboardShortcuts.file, arg_2_1, CSV.codcasterKeyboardShortcuts.cols.keyString)
		local var_2_1 = StringTable.CBGJCDIHCE(CSV.codcasterKeyboardShortcuts.file, arg_2_1, CSV.codcasterKeyboardShortcuts.cols.keyText)
		local var_2_2 = var_0_0 .. ".item." .. arg_2_1

		return {
			index = LUI.DataSourceInGlobalModel.new(var_2_2 .. ".index", arg_2_1),
			keyString = LUI.DataSourceInGlobalModel.new(var_2_2 .. ".keyString", Engine.CBBHFCGDIC(var_2_0)),
			keyText = LUI.DataSourceInGlobalModel.new(var_2_2 .. ".keyText", Engine.CBBHFCGDIC(var_2_1))
		}
	end

	arg_1_0.KeyboardShortcuts:SetGridDataSource(var_1_2, arg_1_1)
end

function CodcasterKeyboardShortcuts(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1300 * _1080p, 0, 690 * _1080p)

	var_3_0.id = "CodcasterKeyboardShortcuts"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = {
		maxVisibleRows = 8,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 3,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = var_3_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("CodcasterKeyboardShortcut", {
				controllerIndex = var_3_1
			})
		end,
		spacingX = _1080p * 16,
		spacingY = _1080p * 16,
		columnWidth = _1080p * 400,
		rowHeight = _1080p * 65,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_3_5 = LUI.UIDataSourceGrid.new(var_3_4)

	var_3_5.id = "KeyboardShortcuts"

	var_3_5:setUseStencil(true)
	var_3_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -618, _1080p * 614, _1080p * -311, _1080p * 327)
	var_3_0:addElement(var_3_5)

	var_3_0.KeyboardShortcuts = var_3_5

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CodcasterKeyboardShortcuts", CodcasterKeyboardShortcuts)
LockTable(_M)
