module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.Icon:setImage(RegisterMaterial(arg_1_1))
	arg_1_0.Title.Text:setText(arg_1_2)
	arg_1_0.Subclass:setText(arg_1_3)
	arg_1_0.Level:setText(tostring(arg_1_4))
	arg_1_0.Subclass:SetAlpha(1)
	arg_1_0.Level:SetAlpha(1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.Icon:setImage(RegisterMaterial(arg_2_1))
	arg_2_0.Title.Text:setText(arg_2_2)
	arg_2_0.Subclass:SetAlpha(0)
	arg_2_0.Level:SetAlpha(0)
end

function PostLoadFunc(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupAttachmentInfo = var_0_0
	arg_3_0.SetupAttachmentCamoInfo = var_0_1
end

function AARParadeAttachment(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 224 * _1080p)

	var_4_0.id = "AARParadeAttachment"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Icon"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 74, _1080p * 202)
	var_4_0:addElement(var_4_6)

	var_4_0.Icon = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Level"

	var_4_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -144, _1080p * 144, _1080p * 202, _1080p * 220)
	var_4_0:addElement(var_4_8)

	var_4_0.Level = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "Title"

	var_4_10.Text:setText(ToUpperCase(""), 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, _1080p * -9, 0, _1080p * 47)
	var_4_0:addElement(var_4_10)

	var_4_0.Title = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "Subclass"

	var_4_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetWordWrap(false)
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 29, _1080p * -15, _1080p * 50, _1080p * 74)
	var_4_0:addElement(var_4_12)

	var_4_0.Subclass = var_4_12

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("AARParadeAttachment", AARParadeAttachment)
LockTable(_M)
