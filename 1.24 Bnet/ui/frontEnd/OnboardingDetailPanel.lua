module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.image then
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.image))
	end

	if arg_1_1.desc then
		if arg_1_1.kbmDesc then
			arg_1_0:addEventHandler("update_input_type", function(arg_2_0, arg_2_1)
				if LUI.IsLastInputKeyboardMouse(arg_2_1.controllerIndex) then
					arg_2_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.kbmDesc))
				else
					arg_2_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.desc))
				end
			end)
		else
			arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_1.desc))
		end
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Setup = var_0_0

	if IsLanguageArabic() then
		arg_3_0.Description:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 265, _1080p * 295)
	end
end

function OnboardingDetailPanel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 350 * _1080p)

	var_4_0.id = "OnboardingDetailPanel"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Image"

	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, 0, _1080p * 256)
	var_4_0:addElement(var_4_4)

	var_4_0.Image = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "Description"

	var_4_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 265, _1080p * 287)
	var_4_0:addElement(var_4_6)

	var_4_0.Description = var_4_6

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("OnboardingDetailPanel", OnboardingDetailPanel)
LockTable(_M)
