module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	assert(arg_1_0.Title)
	assert(arg_1_0.Desciption)

	if arg_1_1.status == 1 then
		ACTIONS.AnimateSequence(arg_1_0, "Complete")
	else
		ACTIONS.AnimateSequence(arg_1_0, "InProgress")
	end

	arg_1_0.Title:setText(arg_1_1.title)
	arg_1_0.Desciption:setText(arg_1_1.description)
	arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.image))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetDetails = var_0_0
end

function OperationObjective(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 120 * _1080p)

	var_3_0.id = "OperationObjective"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIText.new()

	var_3_4.id = "Desciption"

	var_3_4:setText("", 0)
	var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_4:SetAlignment(LUI.Alignment.Left)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 39, _1080p * 494, _1080p * 45, _1080p * 67)
	var_3_0:addElement(var_3_4)

	var_3_0.Desciption = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Status"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 8, _1080p * 27, _1080p * 45, _1080p * 63)
	var_3_0:addElement(var_3_6)

	var_3_0.Status = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Image"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 35, 0, _1080p * 35)
	var_3_0:addElement(var_3_8)

	var_3_0.Image = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Title"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 46, _1080p * 441, _1080p * 8, _1080p * 30)
	var_3_0:addElement(var_3_10)

	var_3_0.Title = var_3_10

	local function var_3_11()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColorNormal
		}
	}

	var_3_6:RegisterAnimationSequence("Complete", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("Complete")
	end

	var_3_0._sequences.Complete = var_3_13

	local var_3_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.disabled
		}
	}

	var_3_6:RegisterAnimationSequence("InProgress", var_3_14)

	local function var_3_15()
		var_3_6:AnimateSequence("InProgress")
	end

	var_3_0._sequences.InProgress = var_3_15

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("OperationObjective", OperationObjective)
LockTable(_M)
