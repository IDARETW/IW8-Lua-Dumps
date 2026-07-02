module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if (Engine.GGFCHCDDE(arg_1_1) or Engine.FIIDEFBHJ(arg_1_1)) and not Engine.HDGDBCJFG() then
		local var_1_0 = {
			[RegisterMaterial("button_primary")] = RegisterMaterial("button_primary_ps4"),
			[RegisterMaterial("button_secondary")] = RegisterMaterial("button_secondary_ps4"),
			[RegisterMaterial("button_alt1")] = RegisterMaterial("button_alt1_ps4"),
			[RegisterMaterial("button_alt2")] = RegisterMaterial("button_alt2_ps4"),
			[RegisterMaterial("button_dpad")] = RegisterMaterial("button_dpad_ps4"),
			[RegisterMaterial("button_select")] = RegisterMaterial("button_select_ps4"),
			[RegisterMaterial("button_start")] = RegisterMaterial("button_start_ps4"),
			[RegisterMaterial("button_shoulder_left")] = RegisterMaterial("button_shoulder_left_ps4"),
			[RegisterMaterial("button_shoulder_right")] = RegisterMaterial("button_shoulder_right_ps4"),
			[RegisterMaterial("button_trigger_left")] = RegisterMaterial("button_trigger_left_ps4"),
			[RegisterMaterial("button_trigger_right")] = RegisterMaterial("button_trigger_right_ps4"),
			[RegisterMaterial("button_stick_left_down")] = RegisterMaterial("button_stick_left_down_ps4"),
			[RegisterMaterial("button_stick_right_down")] = RegisterMaterial("button_stick_right_down_ps4"),
			[RegisterMaterial("button_stick_left_anim")] = RegisterMaterial("button_stick_left_anim_ps4"),
			[RegisterMaterial("button_stick_right_anim")] = RegisterMaterial("button_stick_right_anim_ps4")
		}
		local var_1_1 = arg_1_0.Image.setImage

		function arg_1_0.Image.setImage(arg_2_0, arg_2_1, arg_2_2)
			local var_2_0 = var_1_0[arg_2_1]

			if var_2_0 then
				var_1_1(arg_2_0, var_2_0, arg_2_2)
			else
				var_1_1(arg_2_0, arg_2_1, arg_2_2)
			end
		end

		arg_1_0.Image:setImage(arg_1_0.Image:GetImage(), 0)
	end

	if CONDITIONS.IsLanguageAsian() then
		ACTIONS.AnimateSequence(arg_1_0, "KOZHJP")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function ButtonLayoutPrompt(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 350 * _1080p, 0, 28 * _1080p)

	var_3_0.id = "ButtonLayoutPrompt"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(10 * _1080p)

	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Image"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
	var_3_4:setImage(RegisterMaterial("button_alt1"), 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 28, 0, _1080p * 28)
	var_3_0:addElement(var_3_4)

	var_3_0.Image = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIStyledText.new()

	var_3_6.id = "Text"

	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 38, _1080p * 248, _1080p * 5, _1080p * 23)

	local function var_3_7()
		local var_4_0 = var_3_0:GetDataSource().DataSources.alwaysLoaded.options.stickLayouts.left.upColor:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_6:SetRGBFromInt(var_4_0, 0)
		end
	end

	var_3_6:SubscribeToModelThroughElement(var_3_0, "DataSources.alwaysLoaded.options.stickLayouts.left.upColor", var_3_7)

	local function var_3_8()
		local var_5_0 = var_3_0:GetDataSource().DataSources.alwaysLoaded.options.stickLayouts.left.up:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_6:setText(var_5_0, 0)
		end
	end

	var_3_6:SubscribeToModelThroughElement(var_3_0, "DataSources.alwaysLoaded.options.stickLayouts.left.up", var_3_8)
	var_3_0:addElement(var_3_6)

	var_3_0.Text = var_3_6

	local function var_3_9()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = 2 * _1080p
		}
	}

	var_3_6:RegisterAnimationSequence("KOZHJP", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("KOZHJP")
	end

	var_3_0._sequences.KOZHJP = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Leading,
			value = -10 * _1080p
		}
	}

	var_3_6:RegisterAnimationSequence("AR", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_13

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ButtonLayoutPrompt", ButtonLayoutPrompt)
LockTable(_M)
