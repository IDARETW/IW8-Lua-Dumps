module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}

	for iter_1_0 = 1, #arg_1_2.tabWidgets do
		local var_1_1 = {
			name = ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.tabNames[iter_1_0])),
			focusFunction = function(arg_2_0, arg_2_1)
				if arg_1_0.activeTabWidget then
					arg_1_0.activeTabWidget:closeTree()

					arg_1_0.activeTabWidget = nil
				end

				arg_1_0.activeTabWidget = MenuBuilder.BuildRegisteredType(arg_1_2.tabWidgets[iter_1_0], {
					controllerIndex = arg_1_1
				})

				arg_1_0:addElement(arg_1_0.activeTabWidget)
			end
		}

		table.insert(var_1_0, var_1_1)
	end

	arg_1_0.tabsData = var_1_0

	arg_1_0.Tabs:SetTabs(var_1_0)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_2)
	assert(arg_3_2.title)
	assert(arg_3_2.tabWidgets)
	assert(arg_3_2.tabNames)
	arg_3_0.Title:setText(arg_3_2.title)
	var_0_0(arg_3_0, arg_3_1, arg_3_2)
end

function FullModalTabPopup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "FullModalTabPopup"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.CAC.attachShade, 0)
	var_4_4:SetAlpha(0.7, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1920, _1080p * -540, _1080p * 540)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Frame"

	var_4_6:SetRGBFromInt(3355443, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 1920, _1080p * -463, _1080p * 421)
	var_4_0:addElement(var_4_6)

	var_4_0.Frame = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Title"

	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 580, _1080p * 1340, _1080p * 140, _1080p * 200)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local var_4_9
	local var_4_10 = {
		spacing = 4,
		wrap = false,
		tabHeight = _1080p * 70,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_4_1
			})
		end,
		controllerIndex = var_4_1
	}
	local var_4_11 = LUI.TabManager.new(var_4_10)

	var_4_11.id = "Tabs"

	var_4_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 366, _1080p * 1554, _1080p * 216, _1080p * 344)
	var_4_0:addElement(var_4_11)

	var_4_0.Tabs = var_4_11

	local var_4_12
	local var_4_13 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_13.id = "ButtonHelperBar"

	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1020, _1080p * 1080)
	var_4_0:addElement(var_4_13)

	var_4_0.ButtonHelperBar = var_4_13

	function var_4_0.addButtonHelperFunction(arg_6_0, arg_6_1)
		arg_6_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_14 = LUI.UIBindButton.new()

	var_4_14.id = "selfBindButton"

	var_4_0:addElement(var_4_14)

	var_4_0.bindButton = var_4_14

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("FullModalTabPopup", FullModalTabPopup)
LockTable(_M)
