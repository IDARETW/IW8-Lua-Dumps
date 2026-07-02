module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Name:setText(ATTACHMENT.GetName(arg_1_1))

	if arg_1_1 and arg_1_1 ~= "none" then
		arg_1_0.Slot.Image:setImage(RegisterMaterial(ATTACHMENT.GetImage(arg_1_1)))
		ACTIONS.AnimateSequence(arg_1_0.Slot, "Filled")
	else
		ACTIONS.AnimateSequence(arg_1_0.Slot, "Empty")
		ACTIONS.AnimateSequence(arg_1_0, "Empty")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Slot)
	assert(arg_2_0.Name)

	arg_2_0.Setup = var_0_0
end

function AttachmentDisplay(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 227 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "AttachmentDisplay"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "Name"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 60, 0, _1080p * -11, _1080p * 11)
	var_3_0:addElement(var_3_4)

	var_3_0.Name = var_3_4

	local var_3_5
	local var_3_6 = MenuBuilder.BuildRegisteredType("LargeAttachment", {
		controllerIndex = var_3_1
	})

	var_3_6.id = "Slot"

	var_3_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 50, _1080p * -25, _1080p * 25)
	var_3_0:addElement(var_3_6)

	var_3_0.Slot = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.attachmentEmpty
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Empty", var_3_8)

	local function var_3_9()
		var_3_4:AnimateSequence("Empty")
	end

	var_3_0._sequences.Empty = var_3_9

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("AttachmentDisplay", AttachmentDisplay)
LockTable(_M)
