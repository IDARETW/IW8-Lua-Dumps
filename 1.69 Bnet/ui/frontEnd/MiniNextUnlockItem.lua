module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	if arg_1_3 == 1 then
		arg_1_0.ConnectLine:SetAlpha(0)
	else
		local var_1_0 = arg_1_1.unlocked and 1 or 0.3

		arg_1_0.ConnectLine:SetAlpha(var_1_0)
	end

	arg_1_0.UnlockLevel:setText(Engine.JCBDICCAH(tonumber(arg_1_1.gunsmithAttach.level) + 1))

	local var_1_1 = ATTACHMENT.GetRef(arg_1_1.ref, arg_1_2)
	local var_1_2 = ATTACHMENT.GetImage(var_1_1)

	arg_1_0.Icon:setImage(RegisterMaterial(var_1_2))

	if arg_1_1.unlocked == true then
		ACTIONS.AnimateSequence(arg_1_0, "Unlocked")

		arg_1_0.unlocked = true
	else
		ACTIONS.AnimateSequence(arg_1_0, "Locked")

		arg_1_0.unlocked = false
	end

	if LUI.IsLastInputKeyboardMouse(arg_1_4) then
		arg_1_0.Background:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.UnlockLevel)
	assert(arg_2_0.ConnectLine)
	assert(arg_2_0.Icon)

	arg_2_0.Setup = var_0_0

	local function var_2_0(arg_3_0, arg_3_1)
		if LUI.IsLastInputGamepad(arg_3_1.controllerIndex) then
			if arg_3_0.unlocked then
				ACTIONS.AnimateSequence(arg_3_0, "Unlocked")
			else
				ACTIONS.AnimateSequence(arg_3_0, "Locked")
			end
		else
			arg_3_0.Background:SetAlpha(0)
			arg_3_0.Icon:SetAlpha(0.5)
		end
	end

	arg_2_0:registerAndCallEventHandler("update_input_type", var_2_0, {
		controllerIndex = arg_2_1
	})
end

function MiniNextUnlockItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_4_0.id = "MiniNextUnlockItem"
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

	var_4_4.id = "Background"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.popupBackground, 0)
	var_4_4:SetAlpha(0.4, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "ConnectLine"

	var_4_6:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_4_6:SetUMax(8, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * -25, 0, _1080p * -1, _1080p * 1)
	var_4_0:addElement(var_4_6)

	var_4_0.ConnectLine = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "UnlockLevel"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 5, _1080p * -5, _1080p * 15, _1080p * 33)
	var_4_0:addElement(var_4_8)

	var_4_0.UnlockLevel = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "Icon"

	var_4_10:SetAlpha(0.4, 0)
	var_4_10:setImage(RegisterMaterial("icon_attachment_ar_falima_xmags"), 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 5, _1080p * -5, _1080p * 5, _1080p * -5)
	var_4_0:addElement(var_4_10)

	var_4_0.Icon = var_4_10

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12 = {
		{
			value = 3947580,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Unlocked", var_4_12)

	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		}
	}

	var_4_6:RegisterAnimationSequence("Unlocked", var_4_13)

	local var_4_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Unlocked", var_4_14)

	local var_4_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Unlocked", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("Unlocked")
		var_4_6:AnimateSequence("Unlocked")
		var_4_8:AnimateSequence("Unlocked")
		var_4_10:AnimateSequence("Unlocked")
	end

	var_4_0._sequences.Unlocked = var_4_16

	local var_4_17 = {
		{
			value = 1052688,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("Locked", var_4_17)

	local var_4_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_dashed_line")
		}
	}

	var_4_6:RegisterAnimationSequence("Locked", var_4_18)

	local var_4_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Locked", var_4_19)

	local var_4_20 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Locked", var_4_20)

	local function var_4_21()
		var_4_4:AnimateSequence("Locked")
		var_4_6:AnimateSequence("Locked")
		var_4_8:AnimateSequence("Locked")
		var_4_10:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_21

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MiniNextUnlockItem", MiniNextUnlockItem)
LockTable(_M)
