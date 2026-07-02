LUI.FadeManager = LUI.Class(LUI.UIElement)

function LUI.FadeManager.init(arg_1_0, arg_1_1)
	LUI.UIElement.init(arg_1_0)

	arg_1_0.id = "FadeManager"
	arg_1_0._controllerIndex = arg_1_1 or Engine.IJEBHJIJF()
end

function LUI.FadeManager.ShouldBeVisible(arg_2_0)
	local var_2_0 = false

	if Engine.DDJFBBJAIG() then
		var_2_0 = Engine.DFBHAJECAH()
	elseif Game.HJHDJDCBF() then
		local var_2_1 = Game.BFEEGCHICA(arg_2_0._controllerIndex, "ui_world_fade")

		if var_2_1 then
			var_2_0 = var_2_1 > 0
		end
	end

	return var_2_0
end

function LUI.FadeManager.InitLayer(arg_3_0)
	arg_3_0.fadeWidget = MenuBuilder.BuildRegisteredType("ScreenFade", {
		controllerIndex = arg_3_0._controllerIndex
	})

	arg_3_0:addElement(arg_3_0.fadeWidget)
end

function LUI.FadeManager.ClearLayer(arg_4_0, arg_4_1)
	arg_4_0:closeChildren()

	arg_4_0.fadeWidget = nil
end
