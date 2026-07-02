module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.ProgressText)
	assert(arg_1_0.ProgressBar)

	if arg_1_2.teamIndex ~= -1 then
		assert(arg_1_2.color)
		arg_1_0.ProgressTitle:SetRGBFromTable(COLORS.white)
		arg_1_0.ProgressHeader:SetRGBFromInt(arg_1_2.color, 0)
		arg_1_0.ProgressBorder:SetRGBFromInt(arg_1_2.color, 0)
	end

	local var_1_0 = false

	if var_1_0 then
		arg_1_0.ProgressText:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACT_COMPLETE"))
		arg_1_0.ProgressBar:SetAlpha(0, 0)
	else
		local var_1_1 = 0
		local var_1_2 = tonumber(arg_1_2.challengeData.target)

		assert(var_1_2 ~= 0)

		local var_1_3 = var_1_1 / var_1_2

		arg_1_0.ProgressBar:SetCurrentProgress(var_1_3)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupProgress = var_0_0
end

function ContractProgress(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 660 * _1080p, 0, 130 * _1080p)

	var_3_0.id = "ContractProgress"

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
	var_3_4:SetAlpha(0.6, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "ProgressHeader"

	var_3_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 36)
	var_3_0:addElement(var_3_6)

	var_3_0.ProgressHeader = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "ProgressTitle"

	var_3_8:SetRGBFromInt(0, 0)
	var_3_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESS")), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 10, _1080p * -112, _1080p * 6, _1080p * 30)
	var_3_0:addElement(var_3_8)

	var_3_0.ProgressTitle = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIImage.new()

	var_3_10.id = "ProgressBackground"

	var_3_10:SetRGBFromInt(0, 0)
	var_3_10:SetAlpha(0.5, 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -30, _1080p * -2)
	var_3_0:addElement(var_3_10)

	var_3_0.ProgressBackground = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("ChallengeInfoProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "ProgressBar"

	var_3_12.black:SetAlpha(0, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -30, _1080p * -2)
	var_3_0:addElement(var_3_12)

	var_3_0.ProgressBar = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "ProgressText"

	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 23, _1080p * -10, _1080p * -16.5, _1080p * 31.5)
	var_3_0:addElement(var_3_14)

	var_3_0.ProgressText = var_3_14

	local var_3_15
	local var_3_16 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_3_17 = LUI.UIBorder.new(var_3_16)

	var_3_17.id = "ProgressBorder"

	var_3_17:SetBorderThicknessLeft(_1080p * 2, 0)
	var_3_17:SetBorderThicknessRight(_1080p * 2, 0)
	var_3_17:SetBorderThicknessTop(_1080p * 2, 0)
	var_3_17:SetBorderThicknessBottom(_1080p * 2, 0)
	var_3_0:addElement(var_3_17)

	var_3_0.ProgressBorder = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIImage.new()

	var_3_19.id = "DropShadow"

	var_3_19:SetRGBFromInt(0, 0)
	var_3_19:SetAlpha(0.3, 0)
	var_3_19:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_3_19:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * 4)
	var_3_0:addElement(var_3_19)

	var_3_0.DropShadow = var_3_19

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ContractProgress", ContractProgress)
LockTable(_M)
