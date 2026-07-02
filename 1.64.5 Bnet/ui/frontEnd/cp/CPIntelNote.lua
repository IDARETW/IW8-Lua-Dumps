module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.TextImage:setImage(RegisterMaterial(arg_1_1.imageName), 0)
	arg_1_0.Translation:setText(Engine.CBBHFCGDIC(arg_1_1.desc))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Update = var_0_0
end

function CPIntelNote(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_3_0.id = "CPIntelNote"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "TextImage"

	var_3_4:SetScale(-0.41, 0)
	var_3_4:setImage(RegisterMaterial("intel_note_AX"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 328, _1080p * 2248, _1080p * -46, _1080p * 1034)
	var_3_0:addElement(var_3_4)

	var_3_0.TextImage = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "DoubleNotchedBacker"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.8, 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 800, _1080p * 1296, _1080p * 702, _1080p * 909)
	var_3_0:addElement(var_3_6)

	var_3_0.DoubleNotchedBacker = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "Translation"

	var_3_8:SetRGBFromInt(10853781, 0)
	var_3_8:SetAlpha(0.8, 0)
	var_3_8:setText("CP_INTEL/text", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_8:SetStartupDelay(5000)
	var_3_8:SetLineHoldTime(1000)
	var_3_8:SetAnimMoveTime(150)
	var_3_8:SetAnimMoveSpeed(50)
	var_3_8:SetEndDelay(5000)
	var_3_8:SetCrossfadeTime(400)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(8)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 818, _1080p * 1282, _1080p * 769, _1080p * 787)
	var_3_0:addElement(var_3_8)

	var_3_0.Translation = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Header"

	var_3_10:SetRGBFromInt(3431288, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("CP_INTEL/TRANSLATION"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 815, _1080p * 1207, _1080p * 723, _1080p * 747)
	var_3_0:addElement(var_3_10)

	var_3_0.Header = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Line"

	var_3_12:SetRGBFromInt(3431288, 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 800, _1080p * 1296, _1080p * 752, _1080p * 751)
	var_3_0:addElement(var_3_12)

	var_3_0.Line = var_3_12

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPIntelNote", CPIntelNote)
LockTable(_M)
