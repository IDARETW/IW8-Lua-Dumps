module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function ButtonPromptContainer(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 31 * _1080p)

	var_2_0.id = "ButtonPromptContainer"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(10 * _1080p)

	local var_2_3

	if CONDITIONS.AlwaysFalse(var_2_0) then
		var_2_3 = LUI.UIStyledText.new()
		var_2_3.id = "Label"

		var_2_3:setText("ButtonPrompt", 0)
		var_2_3:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_2_3:SetAlignment(LUI.Alignment.Center)
		var_2_3:SetVerticalAlignment(LUI.Alignment.Center)
		var_2_3:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_2_3:SetStartupDelay(1000)
		var_2_3:SetLineHoldTime(400)
		var_2_3:SetAnimMoveTime(150)
		var_2_3:SetAnimMoveSpeed(50)
		var_2_3:SetEndDelay(1000)
		var_2_3:SetCrossfadeTime(400)
		var_2_3:SetFadeInTime(300)
		var_2_3:SetFadeOutTime(300)
		var_2_3:SetMaxVisibleLines(1)
		var_2_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 18)
		var_2_0:addElement(var_2_3)

		var_2_0.Label = var_2_3
	end

	local function var_2_4()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_4

	if CONDITIONS.AlwaysFalse(var_2_0) then
		local var_2_5 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 30
			}
		}

		var_2_3:RegisterAnimationSequence("AR", var_2_5)
	end

	local function var_2_6()
		if CONDITIONS.AlwaysFalse(var_2_0) then
			var_2_3:AnimateSequence("AR")
		end
	end

	var_2_0._sequences.AR = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("ButtonPromptContainer", ButtonPromptContainer)
LockTable(_M)
