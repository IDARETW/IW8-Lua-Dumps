module(..., package.seeall)

function BarracksChallengesReticles(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0.id = "BarracksChallengesReticles"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	var_1_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_1_1
	})
	var_1_0.HelperBar.id = "HelperBar"

	var_1_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_1_0.HelperBar:setPriority(10)
	var_1_0:addElement(var_1_0.HelperBar)

	local var_1_2 = var_1_0

	return var_1_0
end

MenuBuilder.registerType("BarracksChallengesReticles", BarracksChallengesReticles)
LockTable(_M)
