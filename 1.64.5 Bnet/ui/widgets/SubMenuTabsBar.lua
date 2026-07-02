module(..., package.seeall)

function SubMenuTabsBar(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1300 * _1080p, 0, 69 * _1080p)

	var_1_0.id = "SubMenuTabsBar"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 76,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_1_1
			})
		end,
		buildSpacer = function()
			return MenuBuilder.BuildRegisteredType("TabsSpacer", {
				controllerIndex = var_1_1
			})
		end,
		controllerIndex = var_1_1
	}
	local var_1_5 = LUI.TabManager.new(var_1_4)

	var_1_5.id = "Tabs"

	var_1_5:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -650, _1080p * 430, _1080p * -69, 0)
	var_1_0:addElement(var_1_5)

	var_1_0.Tabs = var_1_5

	return var_1_0
end

MenuBuilder.registerType("SubMenuTabsBar", SubMenuTabsBar)
LockTable(_M)
