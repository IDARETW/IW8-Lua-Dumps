LUI.UIFadeManager = LUI.Class(LUI.UIElement)

function LUI.UIFadeManager.init(arg_1_0, arg_1_1)
	LUI.UIElement.init(arg_1_0)

	arg_1_0.id = "UIFadeManager"
	arg_1_0._controllerIndex = arg_1_1 or Engine.IJEBHJIJF()
end

function LUI.UIFadeManager.ShouldBeVisible(arg_2_0)
	local var_2_0 = false

	if Engine.EAAHGICFBD() then
		if Engine.DDJFBBJAIG() then
			if Engine.DAFGFCFHJI() then
				var_2_0 = DataSources.frontEnd.lobby.isUIFadingOut:GetValue(arg_2_0._controllerIndex)
			end
		elseif Game.HJHDJDCBF() then
			local var_2_1 = Game.BFEEGCHICA(arg_2_0._controllerIndex, "ui_total_fade")

			if var_2_1 then
				var_2_0 = var_2_1 > 0
			end
		end
	end

	return var_2_0
end

function LUI.UIFadeManager.InitLayer(arg_3_0)
	arg_3_0.fadeWidget = MenuBuilder.BuildRegisteredType("ScreenFade", {
		fadeUI = true,
		controllerIndex = arg_3_0._controllerIndex
	})

	arg_3_0:addElement(arg_3_0.fadeWidget)
end

function LUI.UIFadeManager.ClearLayer(arg_4_0, arg_4_1)
	arg_4_0:closeChildren()
end
