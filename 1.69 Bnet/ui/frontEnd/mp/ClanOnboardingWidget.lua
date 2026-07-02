module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Label:setText(Engine.CBBHFCGDIC(arg_1_1))
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0.Image:setImage(RegisterMaterial(arg_2_1))
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._onboardingData = arg_3_1

	if arg_3_0._onboardingData.image and arg_3_0._onboardingData.image ~= "" then
		var_0_1(arg_3_0, arg_3_0._onboardingData.image)
	end

	if arg_3_0._onboardingData.text then
		var_0_0(arg_3_0, arg_3_0._onboardingData.text)
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetData = var_0_2
end

function ClanOnboardingWidget(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 475 * _1080p)

	var_5_0.id = "ClanOnboardingWidget"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Image"

	var_5_0:addElement(var_5_4)

	var_5_0.Image = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "LabelBackground"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0.6, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -100, 0)
	var_5_0:addElement(var_5_6)

	var_5_0.LabelBackground = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Label"

	var_5_8:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetAlignment(LUI.Alignment.Center)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_5_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 24, _1080p * -24, _1080p * -62, _1080p * -38)
	var_5_0:addElement(var_5_8)

	var_5_0.Label = var_5_8

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ClanOnboardingWidget", ClanOnboardingWidget)
LockTable(_M)
