module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2.image then
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.image))
	end

	if arg_1_2.desc then
		if arg_1_2.kbmDesc then
			arg_1_0:addAndCallEventHandler("update_input_type", function(arg_2_0, arg_2_1)
				if Engine.BGGJFFFAFG(arg_2_1.controllerIndex) then
					arg_2_0.Description:setText(Engine.CBBHFCGDIC(arg_1_2.desc))
				else
					arg_2_0.Description:setText(Engine.CBBHFCGDIC(arg_1_2.kbmDesc))
				end
			end, {
				controllerIndex = arg_1_1
			})
		else
			arg_1_0.Description:setText(Engine.CBBHFCGDIC(arg_1_2.desc))
		end
	end

	if arg_1_2.desc_title then
		arg_1_0.Title:setText(Engine.CBBHFCGDIC(arg_1_2.desc_title))
		ACTIONS.AnimateSequence(arg_1_0, "DescsHaveTitles")
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
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

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

	var_4_6:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 276, _1080p * 298)
	var_4_0:addElement(var_4_6)

	var_4_0.Description = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 276, _1080p * 300)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 298
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 320
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_4_6:RegisterAnimationSequence("DescsHaveTitles", var_4_11)

	local var_4_12 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("DescsHaveTitles", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("DescsHaveTitles")
		var_4_8:AnimateSequence("DescsHaveTitles")
	end

	var_4_0._sequences.DescsHaveTitles = var_4_13

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("OnboardingDetailPanel", OnboardingDetailPanel)
LockTable(_M)
