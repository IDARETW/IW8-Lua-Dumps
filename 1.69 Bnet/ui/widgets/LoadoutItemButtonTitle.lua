module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Title)
	assert(arg_1_0.TitleLeft)
	assert(arg_1_0.TitleRight)

	local var_1_0 = ToUpperCase(arg_1_1)
	local var_1_1, var_1_2, var_1_3, var_1_4 = arg_1_0.Title:getLocalRect()
	local var_1_5 = math.abs(var_1_4 - var_1_2)
	local var_1_6 = arg_1_0.Title:GetCurrentFont()
	local var_1_7, var_1_8, var_1_9, var_1_10 = GetTextDimensions(var_1_0, var_1_6, var_1_5)
	local var_1_11 = var_1_9 - var_1_7
	local var_1_12 = 48 * _1080p + var_1_11

	arg_1_0.Title:SetRight(var_1_12)
	arg_1_0.TitleRight:SetLeft(var_1_12 + 8 * _1080p)
	arg_1_0.Title:setText(var_1_0)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupTitle = var_0_0
end

function LoadoutItemButtonTitle(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 836 * _1080p, 0, 20 * _1080p)

	var_3_0.id = "LoadoutItemButtonTitle"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "TitleLeft"

	var_3_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 40, _1080p * -1, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.TitleLeft = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "Title"

	var_3_6:setText("PRIMARY WEAPON", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetWordWrap(false)
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 48, _1080p * 358, _1080p * -9, _1080p * 9)
	var_3_0:addElement(var_3_6)

	var_3_0.Title = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "TitleRight"

	var_3_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 366, 0, _1080p * -1, 0)
	var_3_0:addElement(var_3_8)

	var_3_0.TitleRight = var_3_8

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LoadoutItemButtonTitle", LoadoutItemButtonTitle)
LockTable(_M)
