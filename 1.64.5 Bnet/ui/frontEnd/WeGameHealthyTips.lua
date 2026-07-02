module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)

	arg_1_0:Wait(5000).onComplete = function()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0)
		OpenTitleScreen()
	end
end

function WeGameHealthyTips(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "WeGameHealthyTips"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Background"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "DescLabel"

	var_3_6:setText(Engine.CBBHFCGDIC("WEGAME/HEALTHY_TIPS_DESC"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 227, _1080p * 1727, _1080p * 378, _1080p * 438)
	var_3_0:addElement(var_3_6)

	var_3_0.DescLabel = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "TitleLabel"

	var_3_8:SetScale(0.5, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("WEGAME/HEALTHY_TIPS_TITLE"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 460, _1080p * 1460, _1080p * 228, _1080p * 288)
	var_3_0:addElement(var_3_8)

	var_3_0.TitleLabel = var_3_8

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WeGameHealthyTips", WeGameHealthyTips)
LockTable(_M)
